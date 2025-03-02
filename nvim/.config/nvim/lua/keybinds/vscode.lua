local map = require('helpers').map

-- formatting
map('n', '<leader>lf', function() require('vscode').action('editor.action.formatDocument') end)

-- lsp
map('n', 'gd', function() require('vscode').action('editor.action.goToDeclaration') end)
map('n', 'ge', 'gh')

-- window
map('n', '<C-w>d', function() require('vscode').action('workbench.action.closeOtherEditors') end)
map('n', '<C-w>c', function() require('vscode').action('workbench.action.closeAllEditors') end)

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

-- colorscheme
map('n', '<leader>,s', function() require('vscode').action('workbench.action.toggleLightDarkThemes') end)
