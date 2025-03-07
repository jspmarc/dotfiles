local map = require('helpers').map

-- formatting
map('n', '<leader>lf', function() require('vscode').action('editor.action.formatDocument') end)

-- lsp
map('n', 'gd', function() require('vscode').action('editor.action.goToDeclaration') end)
map({ 'n', 'x' }, 'ge', function() require('vscode').action('editor.action.showHover') end)
map({ 'n', 'x' }, 'gh', function() require('vscode').action('editor.action.showHover') end)

-- window
map('n', '<C-w>d', function() require('vscode').action('workbench.action.closeOtherEditors') end)
map('n', '<C-w>c', function() require('vscode').action('workbench.action.closeAllEditors') end)
map('n', '<leader>cl', function() require('vscode').action('workbench.action.toggleAuxiliaryBar') end)
map('n', '<leader>co', function() require('vscode').action('aichat.newchataction') end)

-- file explorer
map('n', '-', function() require('vscode').action('vsnetrw.open') end)

-- telescope-like functionalities
map('n', '<leader>ts', function() require('vscode').action('workbench.action.quickOpen') end)
map('n', '<leader>tf', function() require('vscode').action('workbench.action.quickOpen') end)
map('n', '<leader>tF', function() require('vscode').action('workbench.action.quickOpen') end)
map('n', '<leader>tw', function() require('vscode').action('workbench.action.findInFiles') end)

-- git-related
map('n', '<leader>gg', function() require('vscode').action('lazygit-vscode.toggle') end)
map('n', '<leader>gp', function() require('vscode').action('git.push') end)
map('n', '<leader>gl', function() require('vscode').action('git.pull') end)
map('n', '<leader>gb', function() require('vscode').action('gitlens.showLineHistoryView') end)
map('n', '<leader>gB', function() require('vscode').action('gitlens.toggleFileBlame') end)
map({ 'n', 'v' }, '<leader>gu', function() require('vscode').action('git.revertSelectedRanges') end)
map({ 'n', 'v' }, '<leader>gs', function() require('vscode').action('git.stageSelectedRanges') end)
map({ 'n', 'v' }, '<leader>gU', function() require('vscode').action('git.unstageSelectedRanges') end)

-- diff
map('n', '<leader>dd', function() require('vscode').action('workbench.action.compareEditor') end)
map('n', '<leader>ga', function() require('vscode').action('editor.action.inlineDiffs.acceptPartialEdit') end)
-- map('n', '<leader>gr', function() require('vscode').action('editor.action.rejectGPT4') end)
map('n', '<leader>gr', function() require('vscode').action('editor.action.inlineDiffs.rejectPartialEdit') end)

-- colorscheme
map('n', '<leader>,s', function() require('vscode').action('workbench.action.toggleLightDarkThemes') end)
