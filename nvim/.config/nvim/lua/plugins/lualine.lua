require('lualine').setup({
	options = {
		disabled_filetypes = { 'dashboard' },
		theme = 'dracula',
	},
	sections = {
		lualine_a = { 'mode' },
		lualine_b = { 'branch' },
		lualine_c = { 'filename', { 'diagnostics', sources = { 'nvim_lsp' } } },
		lualine_x = { 'encoding', 'fileformat' },
		lualine_y = { 'filetype' },
		lualine_z = { 'location' },
	},
})
