return {
	'akinsho/bufferline.nvim',
	dependencies = 'nvim-tree/nvim-web-devicons',
	lazy = false,
	keys = {
		{ '<A-]>', '<cmd>BufferLineCycleNext<CR>' },
		{ '<A-[>', '<cmd>BufferLineCyclePrev<CR>' },
		{ '<C-w>d', '<cmd>BufferLineCloseOthers<CR>' },
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
