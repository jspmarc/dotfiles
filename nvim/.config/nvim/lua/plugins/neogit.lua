return {
	'NeogitOrg/neogit',
	cmd = { 'Neogit', 'NeogitCommit', 'NeogitLogCurrent', 'NeogitResetState' },
	keys = {
		{ '<leader>gp', ':Neogit push<CR>',   desc = 'Git push' },
		{ '<leader>gc', ':Neogit commit<CR>', desc = 'Git commit' },
		{ '<leader>gl', ':Neogit pull<CR>',   desc = 'Git pull' },
	},
	dependencies = {
		'nvim-lua/plenary.nvim',
		'sindrets/diffview.nvim',
	},
	opts = {},
}
