return {
	'lukas-reineke/indent-blankline.nvim',
	main = 'ibl',
	opts = {
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
