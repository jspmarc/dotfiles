return {
	'lukas-reineke/indent-blankline.nvim',
	config = function()
		require('ibl').setup({
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
		})
	end,
}
