return {
	'NeogitOrg/neogit',
	cmd = { 'Neogit', 'NeogitCommit', 'NeogitLogCurrent', 'NeogitResetState' },
	keys = {
		{ '<leader>gp', ':Neogit push<CR>' },
		{ '<leader>gc', ':Neogit commit<CR>' },
		{ '<leader>gl', ':Neogit pull<CR>' },
	},
	dependencies = {
		'nvim-lua/plenary.nvim',
		'sindrets/diffview.nvim',
	},
	opts = {},
}
