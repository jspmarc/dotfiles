local plugin_keys = require('keybinds.plugins')

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
		dashboard = {
			preset = {
				keys = {
					{ icon = ' ', key = 'f', desc = 'Find File', action = ':Telescope find_files' },
					{ icon = ' ', key = 'n', desc = 'New File', action = ':ene' },
					{
						icon = ' ',
						key = 'g',
						desc = 'Find Text',
						action = ':Telescope live_grep',
					},
					{
						icon = ' ',
						key = 'r',
						desc = 'Recent Files',
						action = ':Telescope oldfiles',
					},
					{
						icon = ' ',
						key = 'c',
						desc = 'Config',
						action = ":lua require('telescope.builtin').find_files({cwd = vim.fn.stdpath('config')})",
					},
					{ icon = ' ', key = 's', desc = 'Restore Session', section = 'session' },
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
				{ section = 'keys',    gap = 1 },
			},
		},
		input = { enabled = true },
		lazygit = { enabled = true },
		notifier = { enabled = true },
		picker = { enabled = true },
		quickfile = { enabled = true },
		scope = { enabled = true },
	},
}
