local plugin_keys = require('keybinds.plugins')

return {
	enabled = false,
	'folke/flash.nvim',
	event = 'VeryLazy',
	---@type flash.config
	opts = {},
	modes = {
		search = {
			enabled = true,
			search = {
				jump = {
					autojump = true,
				},
			},
		},
		char = {
			jump_labels = true,
			multi_line = false,
			jump = {
				autojump = true,
			},
		},
	},
	keys = plugin_keys.flash,
}
