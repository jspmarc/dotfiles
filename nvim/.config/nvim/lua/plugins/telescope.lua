return {
	'nvim-telescope/telescope.nvim',
	keys = {
		{ '<leader>tb', '<cmd>lua require("telescope.builtin").buffers()<CR>' },
		{ '<leader>tf', '<cmd>Telescope find_files<CR>' },
		{ '<leader>tF', '<cmd>Telescope find_files hidden=true no_ignore=true<CR>' },
		{ '<leader>th', '<cmd>lua require("telescope.builtin").oldfiles()<CR>' },
		{ '<leader>to', '<cmd>TodoTelescope<CR>' },
		{ '<leader>tq', '<cmd>lua require("telescope.builtin").quickfix()<CR>' },
		{ '<leader>tw', '<cmd>lua require("telescope.builtin").live_grep()<CR>' },
	},
	dependencies = {
		'nvim-lua/plenary.nvim',
		{
			'nvim-telescope/telescope-fzf-native.nvim',
			build = 'make',
			config = function()
				require('telescope').load_extension('fzf')
			end,
		},
	},
	opts = {
		extensions = {
			fzf = {
				fuzzy = true,
				override_generic_sorter = true,
				override_file_sorter = true,
				case_mode = 'smart_case',
			},
		},
		pickers = {
			hidden = true,
		},
	},
}
