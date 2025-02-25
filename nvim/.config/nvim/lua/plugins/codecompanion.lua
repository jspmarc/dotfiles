return {
	'olimorris/codecompanion.nvim',
	cmd = {
		'CodeCompanion',
		'CodeCompanionChat',
		'CodeCompanionCmd',
		'CodeCompanionActions',
	},
	keys = {
		{ '<leader>ca', '<cmd>CodeCompanionActions<CR>', mode = { 'n', 'v' }, desc = 'Open CodeCompanion actions' },
		{ '<leader>cq', '<cmd>CodeCompanion<CR>',        mode = { 'n', 'v' }, desc = 'Open CodeCompanion prompt' },
		{ '<leader>co', '<cmd>CodeCompanionChat<CR>',    mode = { 'n', 'v' }, desc = 'Open CodeCompanion chat' },
	},
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
