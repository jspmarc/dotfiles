local plugin_keys = require('keybinds.plugins')

return {
	enabled = require('helpers').not_vscode,
	'akinsho/bufferline.nvim',
	dependencies = 'nvim-tree/nvim-web-devicons',
	lazy = false,
	keys = plugin_keys.bufferline,
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
