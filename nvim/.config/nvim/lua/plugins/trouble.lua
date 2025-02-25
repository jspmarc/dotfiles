return {
	'folke/trouble.nvim',
	requires = { 'kyazdani42/nvim-web-devicons' },
	cmd = { 'Trouble', 'TodoTrouble' },
	keys = {
		{ '<leader>xa', '<cmd>Trouble diagnostics toggle<CR>', desc = 'Toggle trouble diagnostics' },
		{
			'<leader>xd',
			'<cmd>Trouble diagnostics toggle filter.buf=0<CR>',
			desc = 'Toggle trouble diagnostics for current buffer',
		},
		{ '<leader>xo', '<cmd>TodoTrouble<CR>',                desc = 'Open todo trouble' },
		{ '<leader>xx', '<cmd>Trouble close<CR>',              desc = 'Close trouble' },
	},
	opts = {
		actions_keys = {
			open_split = { 's' },
			open_vsplit = { 'v' },
		},
	},
}
