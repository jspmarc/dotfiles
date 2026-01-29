local plugin_keys = require('keybinds.plugins')

return {
	enabled = false,
	'A7Lavinraj/fyler.nvim',
	dependencies = { 'nvim-mini/mini.icons' },
	branch = 'stable', -- Use stable branch for production
	lazy = false,   -- Necessary for `default_explorer` to work properly
	keys = plugin_keys['fyler'],
	opts = {},
}
