return {
	'nvim-lualine/lualine.nvim',
	event = { 'VimEnter' },
	config = function()
		require('lualine').setup({
			options = {
				disabled_filetypes = { 'dashboard' },
				theme = 'onedark',
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
		})
	end,
}
