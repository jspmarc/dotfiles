return {
	'numToStr/Comment.nvim',
	event = 'BufEnter',
	config = function()
		require('Comment').setup({
			ignore = '^%s*$',
			pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
		})
	end,
	dependencies = {
		'nvim-treesitter/nvim-treesitter',
		'JoosepAlviste/nvim-ts-context-commentstring'
	},
}
