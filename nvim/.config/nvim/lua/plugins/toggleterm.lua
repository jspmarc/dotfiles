local plugin_keys = require('keybinds.plugins')

return {
	enabled = require('helpers').not_vscode,
	'akinsho/toggleterm.nvim',
	opts = {
		direction = 'float',
		open_mapping = [[<C-t>]],
	},
	keys = plugin_keys.toggleterm,
}
