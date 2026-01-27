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
			preset = {
				keys = {
					{
						icon = ' ',
						key = 'p',
						desc = 'Restore Session',
						action = ":lua require('session_manager').load_session()",
					},
					{ icon = ' ', key = 'f', desc = 'Find File', action = ":lua Snacks.dashboard.pick('files')" },
					{
						icon = ' ',
						key = 'r',
						desc = 'Recent Files',
						action = ":lua Snacks.dashboard.pick('oldfiles')",
					},
					{
						icon = ' ',
						key = 'c',
						desc = 'Config',
						action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
					},
					{
						icon = '󰒲 ',
						key = 'L',
						desc = 'Lazy',
						action = ':Lazy',
						enabled = package.loaded.lazy ~= nil,
					},
					{ icon = ' ', key = 'q', desc = 'Quit', action = ':qa' },
				},
			},
			sections = {
				{ section = 'header' },
				{ section = 'startup', padding = 1 },
				{ section = 'keys', gap = 1 },
			},
		},
		gitbrowse = { enabled = true },
		input = { enabled = true },
		lazygit = { enabled = true },
		notifier = { enabled = true },
		picker = { enabled = true },
		quickfile = { enabled = true },
		scope = { enabled = true },
		scratch = { enabled = true },
		scroll = { enabled = false },
	},
}
