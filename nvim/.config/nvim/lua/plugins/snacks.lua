local plugin_keys = require('keybinds.plugins')
local helpers = require('helpers')

return {
	enabled = require('helpers').not_vscode,
	'folke/snacks.nvim',
	priority = 1000,
	lazy = false,
	keys = plugin_keys.snacks,
	---@type snacks.Config
	opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
		bigfile = { enabled = true },
		bufdelete = { enabled = true },
		dashboard = {
			sections = {
				{ section = 'header' },
				{ section = 'startup', padding = 1 },
				{ section = 'keys',    gap = 1 },
			},
		},
		gitbrowse = { enabled = true },
		input = { enabled = true },
		lazygit = { enabled = true },
		notifier = { enabled = true },
		picker = { enabled = true },
		quickfile = { enabled = true },
		scope = { enabled = true },
		scroll = { enabled = helpers.not_neovide },
	},
}
