local not_vscode = require('helpers').not_vscode
local not_neovide = require('helpers').not_neovide
local keybinds = require('keybinds.default')

if not_vscode then
	keybinds = vim.list_extend(keybinds, require('keybinds.native'))
else
	require('keybinds.vscode')
end

if not not_neovide then
	keybinds = vim.list_extend(keybinds, require('keybinds.neovide'))
end

require('which-key').add(keybinds)
