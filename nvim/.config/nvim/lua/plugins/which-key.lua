local plugin_keys = require('keybinds.plugins')

return {
	'folke/which-key.nvim',
	event = 'VeryLazy',
	opts = {},
	keys = plugin_keys['which-key'],
}
