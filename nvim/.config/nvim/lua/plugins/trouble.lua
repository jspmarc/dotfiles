return {
	'folke/trouble.nvim',
	requires = { 'kyazdani42/nvim-web-devicons' },
	cmd = { 'Trouble', 'TodoTrouble' },
	keys = {
		{ '<leader>xa', '<cmd>Trouble diagnostics toggle<CR>' },
		{ '<leader>xd', '<cmd>Trouble diagnostics toggle filter.buf=0<CR>' },
		{ '<leader>xo', '<cmd>TodoTrouble<CR>' },
		{ '<leader>xx', '<cmd>Trouble close<CR>' },
	},
	opts = {
		actions_keys = {
			open_split = { 's' },
			open_vsplit = { 'v' },
		},
	},
}
