return {
	'karb94/neoscroll.nvim',
	config = function()
		require('neoscroll').setup({
			mappings = { '<C-u>', '<C-d>', '<C-u>', 'zz', 'zb', 'zt' },
		})
	end,
}
