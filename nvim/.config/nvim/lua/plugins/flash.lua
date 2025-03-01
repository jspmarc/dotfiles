local plugin_keys = require('keybinds.plugins')

return {
	enabled = false,
	'folke/flash.nvim',
	event = 'VeryLazy',
	---@type Flash.Config
	opts = {},
	keys = plugin_keys.flash,
}
