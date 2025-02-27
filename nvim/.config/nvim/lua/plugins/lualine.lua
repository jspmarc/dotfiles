return {
	'nvim-lualine/lualine.nvim',
	event = { 'BufReadPost', 'BufNewFile' },
	opts = {
		options = {
			disabled_filetypes = { 'dashboard' },
			theme = 'auto',
		},
		sections = {
			lualine_a = { 'mode' },
			lualine_b = { 'branch', 'diff' },
			lualine_c = {
				{
					'filename',
					file_status = true,
					path = 1,
				},
				{
					'diagnostics',
					sources = { 'nvim_diagnostic' },
				},
			},
			lualine_x = { 'encoding', 'fileformat' },
			lualine_y = { 'filetype' },
			lualine_z = { 'location' },
		},
	},
}
