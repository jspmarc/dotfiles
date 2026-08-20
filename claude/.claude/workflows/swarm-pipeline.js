export const meta = {
  name: 'swarm-pipeline',
  description: 'Gated pipeline: architect plans, critic approves, coders implement, reviewer + test-engineer gate each task, docs sync at the end',
  whenToUse: 'Non-trivial features or fixes that deserve plan/review/test gates. Not for quick questions or one-line edits.',
  phases: [
    { title: 'Plan', detail: 'architect drafts, critic gates (max 2 revisions)' },
    { title: 'Build', detail: 'per task: coder → reviewer gate → test-engineer gate' },
    { title: 'Docs', detail: 'docs agent syncs documentation for passed tasks' },
  ],
}

let ARGS = args
if (typeof ARGS === 'string') {
  try { ARGS = JSON.parse(ARGS) } catch (e) { ARGS = { request: ARGS } }
}
const REQUEST = ARGS && ARGS.request
if (!REQUEST) return { error: 'No request provided. Pass args: { request: "..." }' }

const PLAN_SCHEMA = {
  type: 'object',
  required: ['goal', 'tasks'],
  properties: {
    goal: { type: 'string' },
    assumptions: { type: 'array', items: { type: 'string' } },
    risks: { type: 'array', items: { type: 'string' } },
    tasks: {
      type: 'array',
      items: {
        type: 'object',
        required: ['id', 'goal', 'files', 'depends_on', 'acceptance'],
        properties: {
          id: { type: 'string' },
          goal: { type: 'string' },
          files: { type: 'array', items: { type: 'string' } },
          depends_on: { type: 'array', items: { type: 'string' } },
          acceptance: { type: 'string' },
        },
      },
    },
  },
}

const CRITIC_SCHEMA = {
  type: 'object',
  required: ['approved', 'objections'],
  properties: {
    approved: { type: 'boolean' },
    objections: {
      type: 'array',
      items: {
        type: 'object',
        required: ['severity', 'objection'],
        properties: {
          severity: { type: 'string', enum: ['BLOCKER', 'MAJOR', 'MINOR'] },
          objection: { type: 'string' },
          suggested_fix: { type: 'string' },
        },
      },
    },
  },
}

const REVIEW_SCHEMA = {
  type: 'object',
  required: ['pass', 'findings'],
  properties: {
    pass: { type: 'boolean' },
    findings: {
      type: 'array',
      items: {
        type: 'object',
        required: ['location', 'severity', 'problem'],
        properties: {
          location: { type: 'string' },
          severity: { type: 'string', enum: ['BLOCKER', 'MAJOR', 'MINOR'] },
          problem: { type: 'string' },
          fix: { type: 'string' },
        },
      },
    },
  },
}

const TEST_SCHEMA = {
  type: 'object',
  required: ['pass', 'summary'],
  properties: {
    pass: { type: 'boolean' },
    summary: { type: 'string' },
    failing: { type: 'array', items: { type: 'string' } },
  },
}

const CODER_SCHEMA = {
  type: 'object',
  required: ['status', 'changes'],
  properties: {
    status: { type: 'string', enum: ['DONE', 'BLOCKED'] },
    changes: { type: 'array', items: { type: 'string' } },
    notes: { type: 'string' },
  },
}

// ---- Phase 1: Plan (architect drafts, critic gates, max 2 revisions) ----
phase('Plan')
let plan = null
let critique = null
let feedback = ''
for (let round = 0; round < 3; round++) {
  plan = await agent(
    `Produce an implementation plan for this request:\n\n${REQUEST}\n\n` +
      (feedback ? `A critic rejected the previous plan. Address every objection:\n${feedback}\n\n` : '') +
      'Keep tasks file-scoped and independently verifiable. depends_on must reference task ids.',
    { agentType: 'architect', label: `architect:round${round + 1}`, phase: 'Plan', schema: PLAN_SCHEMA }
  )
  if (!plan) return { error: 'Architect failed to produce a plan.' }

  critique = await agent(
    `Review this implementation plan for the request "${REQUEST}". Verify grounding against the actual codebase.\n\n${JSON.stringify(plan, null, 2)}`,
    { agentType: 'critic', label: `critic:round${round + 1}`, phase: 'Plan', schema: CRITIC_SCHEMA }
  )
  if (critique && critique.approved) break
  feedback = JSON.stringify((critique && critique.objections) || [], null, 2)
  log(`Critic rejected plan (round ${round + 1}); objections: ${((critique && critique.objections) || []).length}`)
}
if (!critique || !critique.approved) {
  return { status: 'BLOCKED_AT_PLAN', plan, needs_human: critique ? critique.objections : ['critic did not respond'] }
}
log(`Plan approved: ${plan.tasks.length} task(s)`)

// ---- Phase 2: Build (dependency batches; within a batch, tasks run in parallel) ----
phase('Build')
const done = new Set()
const results = {}
const pending = [...plan.tasks]

async function runTask(task) {
  let reviewFeedback = ''
  let lastReview = null
  for (let attempt = 0; attempt < 3; attempt++) {
    const coded = await agent(
      `Implement this task from an approved plan (overall goal: ${plan.goal}).\n\n${JSON.stringify(task, null, 2)}\n\n` +
        (reviewFeedback ? `A reviewer failed your previous attempt. Fix every finding:\n${reviewFeedback}` : ''),
      { agentType: 'coder', label: `coder:${task.id}#${attempt + 1}`, phase: 'Build', schema: CODER_SCHEMA }
    )
    if (!coded || coded.status === 'BLOCKED') {
      return { task: task.id, status: 'BLOCKED', detail: coded ? coded.notes : 'coder died' }
    }
    lastReview = await agent(
      `Review the current uncommitted changes for this task (use git diff, restrict attention to files: ${task.files.join(', ')}).\n` +
        `Task spec: ${JSON.stringify(task, null, 2)}`,
      { agentType: 'reviewer', label: `review:${task.id}#${attempt + 1}`, phase: 'Build', schema: REVIEW_SCHEMA }
    )
    if (lastReview && lastReview.pass) break
    reviewFeedback = JSON.stringify((lastReview && lastReview.findings) || [], null, 2)
  }
  if (!lastReview || !lastReview.pass) {
    return { task: task.id, status: 'FAILED_REVIEW', findings: lastReview ? lastReview.findings : [] }
  }

  let tested = await agent(
    `Write and run tests for this completed task. Implementation files are read-only for you.\n${JSON.stringify(task, null, 2)}`,
    { agentType: 'test-engineer', label: `test:${task.id}`, phase: 'Build', schema: TEST_SCHEMA }
  )
  if (tested && !tested.pass) {
    const fixed = await agent(
      `Tests are failing for task ${task.id}. Fix the implementation (not the tests) so they pass.\n` +
        `Task: ${JSON.stringify(task, null, 2)}\nFailures: ${JSON.stringify(tested.failing || tested.summary)}`,
      { agentType: 'coder', label: `coder:${task.id}#testfix`, phase: 'Build', schema: CODER_SCHEMA }
    )
    if (fixed && fixed.status === 'DONE') {
      tested = await agent(
        `Re-run the tests for task ${task.id} and report results. Add missing coverage only if acceptance criteria are untested.\n${JSON.stringify(task, null, 2)}`,
        { agentType: 'test-engineer', label: `retest:${task.id}`, phase: 'Build', schema: TEST_SCHEMA }
      )
    }
  }
  return {
    task: task.id,
    status: tested && tested.pass ? 'PASSED' : 'FAILED_TESTS',
    tests: tested ? tested.summary : 'test-engineer died',
  }
}

while (pending.length > 0) {
  const batch = pending.filter(t => (t.depends_on || []).every(d => done.has(d)))
  if (batch.length === 0) {
    return { status: 'BLOCKED_AT_BUILD', error: 'Dependency cycle or failed prerequisite', remaining: pending.map(t => t.id), results }
  }
  log(`Running batch: ${batch.map(t => t.id).join(', ')}`)
  const batchResults = await parallel(batch.map(t => () => runTask(t)))
  batch.forEach((t, i) => {
    results[t.id] = batchResults[i] || { task: t.id, status: 'BLOCKED', detail: 'agent skipped' }
    pending.splice(pending.indexOf(t), 1)
    if (results[t.id].status === 'PASSED') done.add(t.id)
  })
  const failed = batch.filter(t => results[t.id].status !== 'PASSED')
  if (failed.length > 0) log(`Failed in batch: ${failed.map(t => t.id).join(', ')} — dependents will not run`)
}

// ---- Phase 3: Docs (only over passed tasks) ----
phase('Docs')
const passed = plan.tasks.filter(t => done.has(t.id))
let docs = null
if (passed.length > 0) {
  docs = await agent(
    `Update documentation to match these completed changes (inspect git diff for details):\n${JSON.stringify(passed, null, 2)}`,
    { agentType: 'docs', label: 'docs:sync', phase: 'Docs' }
  )
}

const failedTasks = Object.values(results).filter(r => r.status !== 'PASSED')
return {
  status: failedTasks.length === 0 ? 'ALL_PASSED' : 'PARTIAL',
  goal: plan.goal,
  results,
  docs,
  needs_human: failedTasks,
}
