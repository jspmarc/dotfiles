require('bufferline').setup({
	options = {

		diagnostics = 'nvim_lsp',

		offsets = { { filetype = 'NvimTree', text = 'File Explorer' } },

		separator_style = 'thick',

		numbers = function (opts)
			return string.format('%s%s', opts.id, opts.lower(opts.ordinal))
		end

	},

})
