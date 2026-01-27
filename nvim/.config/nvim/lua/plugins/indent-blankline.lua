return {
	enabled = require('helpers').not_vscode,
	'lukas-reineke/indent-blankline.nvim',
	main = 'ibl',
	opts = {
		indent = {
			char = '▏',
			tab_char = '╏',
		},
		whitespace = {
			remove_blankline_trail = false,
		},
		exclude = {
			filetypes = {
				'dashboard',
				'lsp-installer',
				'lspinfo',
				'packer',
				'checkhealth',
				'help',
				'lazy',
				'man',
				'gitcommit',
				'TelescopePrompt',
				'TelescopeResults',
				'',
			},
		},
	},
}
