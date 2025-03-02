local plugin_keys = require('keybinds.plugins')

return {
	enabled = false,
	'olimorris/codecompanion.nvim',
	cmd = {
		'CodeCompanion',
		'CodeCompanionChat',
		'CodeCompanionCmd',
		'CodeCompanionActions',
	},
	keys = plugin_keys.codecompanion,
	opts = {
		strategies = {
			chat = {
				adapter = 'copilot',
			},
			inline = {
				adapter = 'copilot',
			},
			agent = {
				adapter = 'copilot',
			},
		},
	},
	init = function()
		require('plugins.codecompanion.fidget'):init()
	end,
	dependencies = {
		'github/copilot.vim',
		'nvim-lua/plenary.nvim',
		'nvim-treesitter/nvim-treesitter',
		'j-hui/fidget.nvim',       -- Optional: For the fidget spinner
		'hrsh7th/nvim-cmp',        -- Optional: For using slash commands and variables in the chat buffer
		'nvim-telescope/telescope.nvim', -- Optional: For using slash commands
		'folke/snacks.nvim',       -- Optional: Improves `vim.ui.select`
	},
}
