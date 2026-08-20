---
name: swarm
description: Run the gated multi-agent pipeline (architect → critic → coder → reviewer → test-engineer → docs) on a feature request or bug fix. Trigger on /swarm <request> or when the user asks to "swarm" a task.
---

# Swarm pipeline

Run the user's request through the gated multi-agent pipeline defined in `.claude/workflows/swarm-pipeline.js`.

## How to run

1. Take the user's request (the skill arguments). If empty, ask what to build — do not invent a task.
2. For quick context questions or single-file trivial edits, tell the user the pipeline is overkill and handle it directly instead.
3. Otherwise invoke the workflow. Prefer the project-local script if `.claude/workflows/swarm-pipeline.js` exists in the current repo; otherwise use the global copy (expand ~ to the user's home directory):

```
Workflow({
  scriptPath: "~/.claude/workflows/swarm-pipeline.js",
  args: { request: "<the user's request, verbatim, plus any constraints they stated>" }
})
```

4. While it runs, relay phase progress if the user asks (`/workflows` shows the live tree).
5. When it completes, report to the user:
   - the plan that was executed (goal + task list, one line each),
   - per-task outcome (done / blocked, review verdict, test verdict),
   - anything the pipeline returned as `needs_human` (unresolved critic objections, blocked tasks, failing tests),
   - suggest reviewing `git diff` before committing. Never commit unless the user asks.

## Gate semantics (enforced by the script — do not bypass)

- Critic must approve the plan (up to 2 revision rounds) before any coder runs.
- Each task: coder → reviewer gate (retry loop) → test-engineer gate.
- Tasks run in dependency order; file-disjoint tasks in the same batch run in parallel.
- Docs agent runs once at the end, only over tasks that passed.

## Resume

If a run is interrupted or a task fails and the user wants to retry after manual fixes: re-invoke Workflow with the same scriptPath plus `resumeFromRunId` from the failed run — completed agent calls replay from cache.
