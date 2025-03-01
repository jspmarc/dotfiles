return {
	enabled = require('helpers').not_vscode,
	'folke/snacks.nvim',
	priority = 1000,
	lazy = false,
	keys = {
		{
			'<leader>gg',
			function()
				require('snacks').lazygit.open()
			end,
			desc = 'Open lazy git',
		},
	},
	---@type snacks.Config
	opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
		bigfile = { enabled = true },
		input = { enabled = true },
		lazygit = { enabled = true },
		notifier = { enabled = true },
		picker = { enabled = true },
		quickfile = { enabled = true },
		scope = { enabled = true },
	},
}
