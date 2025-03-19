return {
	-- resize windows
	{ '<leader>+',  '<cmd>exe "vertical resize +10"<CR>' },
	{ '<leader>_',  '<cmd>exe "vertical resize -10"<CR>' },
	{ '<leader>=',  '<cmd>exe "resize +5"<CR>' },
	{ '<leader>-',  '<cmd>exe "resize -5"<CR>' },

	-- buffer
	-- { '<leader>bd', '<cmd>bd<CR>',                       desc = 'Delete buffer' },
	-- { '<leader>bk', '<cmd>bd<CR>',                       desc = 'Delete buffer' },
	-- { '<C-n>',      '<cmd>enew<CR>',                     desc = 'New buffer' },

	-- colorscheme
	{
		'<leader>,s',
		function()
			require('helpers').set_colorscheme()
		end,
		desc = 'Set colorscheme',
	},
}

