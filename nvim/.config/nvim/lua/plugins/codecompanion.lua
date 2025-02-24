return {
	'olimorris/codecompanion.nvim',
	cmd = {
		'CodeCompanion',
		'CodeCompanionChat',
		'CodeCompanionCmd',
		'CodeCompanionActions',
	},
	keys = {
		{ '<leader>cca', '<cmd>CodeCompanionActions<CR>', mode = { 'n', 'v' } },
		{ '<leader>ccq', '<cmd>CodeCompanion<CR>',        mode = { 'n', 'v' } },
		{ '<leader>cco', '<cmd>CodeCompanionChat<CR>',    mode = { 'n', 'v' } },
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
	dependencies = {
		'github/copilot.vim',
		'nvim-lua/plenary.nvim',
		'nvim-treesitter/nvim-treesitter',
		'hrsh7th/nvim-cmp',        -- Optional: For using slash commands and variables in the chat buffer
		'nvim-telescope/telescope.nvim', -- Optional: For using slash commands
		'folke/snacks.nvim',       -- Optional: Improves `vim.ui.select`
	},
}
