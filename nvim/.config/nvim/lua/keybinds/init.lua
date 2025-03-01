local not_vscode = require('helpers').not_vscode
local keybinds = require('keybinds.default')

if not_vscode then
	keybinds = vim.list_extend(keybinds, require('keybinds.native'))
else
	require('keybinds.vscode')
end

require('which-key').add(keybinds)
