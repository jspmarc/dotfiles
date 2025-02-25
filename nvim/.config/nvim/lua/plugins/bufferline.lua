return {
	'akinsho/bufferline.nvim',
	dependencies = 'nvim-tree/nvim-web-devicons',
	lazy = false,
	keys = {
		{ '<A-]>',  '<cmd>BufferLineCycleNext<CR>',   desc = 'Go to next buffer' },
		{ '<A-[>',  '<cmd>BufferLineCyclePrev<CR>',   desc = 'Go to previous buffer' },
		{ '<C-w>d', '<cmd>BufferLineCloseOthers<CR>', desc = 'Close other buffers' },
	},
	opts = {
		options = {
			diagnostics = 'nvim_lsp',
			offsets = { { filetype = 'NvimTree', text = 'File Explorer' } },
			separator_style = 'thick',
			numbers = function(opts)
				return string.format('%s%s', opts.id, opts.lower(opts.ordinal))
			end,
		},
	},
}
