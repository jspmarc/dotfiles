return {
	'olimorris/codecompanion.nvim',
	event = 'VeryLazy',
	config = function()
		require('codecompanion').setup({
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
		})
	end,
	dependencies = {
		'github/copilot.vim',
		'nvim-lua/plenary.nvim',
		'nvim-treesitter/nvim-treesitter',
		'hrsh7th/nvim-cmp', -- Optional: For using slash commands and variables in the chat buffer
		'nvim-telescope/telescope.nvim', -- Optional: For using slash commands
		'stevearc/dressing.nvim', -- Optional: Improves `vim.ui.select`
	},
}
