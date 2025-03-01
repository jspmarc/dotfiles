local map = require('helpers').map

map('n', '<leader>gg', '<cmd>lua require("vscode").action("lazygit-vscode.toggle")<CR>')
map('n', '<leader>,s', '<cmd>lua require("vscode").action("workbench.action.toggleLightDarkThemes")<CR>')
map('n', '<leader>lf', '<cmd>lua require("vscode").action("editor.action.formatDocument")<CR>')
map('n', '-', function()
	require('vscode').action('vsnetrw.open')
end)
