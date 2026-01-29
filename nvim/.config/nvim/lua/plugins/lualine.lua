return {
	enabled = require('helpers').not_vscode,
	'nvim-lualine/lualine.nvim',
	event = { 'BufReadPost', 'BufNewFile' },
	opts = {
		options = {
			disabled_filetypes = { 'dashboard', 'Avante', 'AvanteSelectedFiles', 'AvanteInput', 'opencode_terminal' },
			theme = 'auto',
		},
		winbar = {
			lualine_a = {
				{
					'filename',
					file_status = true,
					path = 1,
				},
			},
			lualine_b = { 'location' },
			lualine_c = {},
			lualine_x = {},
			lualine_y = {},
			lualine_z = {},
		},
		inactive_winbar = {
			lualine_a = {
				{
					'filename',
					file_status = true,
					path = 1,
					shorting_target = 80,
				},
			},
			lualine_b = { 'location' },
			lualine_c = {},
			lualine_x = {},
			lualine_y = {},
			lualine_z = {},
		},
		sections = {
			lualine_a = { 'mode' },
			lualine_b = { 'branch', 'diff' },
			lualine_c = {
				{
					'diagnostics',
					sources = { 'nvim_diagnostic' },
				},
			},
			lualine_x = { 'searchcount', 'selectioncount' },
			lualine_y = { 'encoding', 'fileformat' },
			lualine_z = { 'filetype' },
		},
		inactive_sections = {
			lualine_a = {},
			lualine_b = {},
			lualine_c = { 'filename' },
			lualine_x = { 'location' },
			lualine_y = {},
			lualine_z = {},
		},
	},
}
