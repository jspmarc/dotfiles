return {
	'lewis6991/gitsigns.nvim',
	event = { 'BufReadPost' },
	keys = {
		{ '<leader>gh', '<cmd>lua require"gitsigns".preview_hunk()<CR>', noremap = false, desc = 'Preview git hunk' },
		{ '<leader>gs', '<cmd>lua require"gitsigns".stage_hunk()<CR>',   noremap = false, desc = 'Stage git hunk' },
		{
			'<leader>gs',
			'<cmd>lua require"gitsigns".stage_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>',
			noremap = false,
			mode = 'v',
			desc = 'Stage git hunk',
		},
		{
			'<leader>g]',
			'<cmd>lua require"gitsigns".next_hunk()<CR>',
			noremap = false,
			desc = 'Go to next git hunk',
		},
		{
			'<leader>g[',
			'<cmd>lua require"gitsigns".prev_hunk()<CR>',
			noremap = false,
			desc = 'Previous go to previous git hunk',
		},
		{
			'<leader>gu',
			'<cmd>lua require"gitsigns".reset_hunk()<CR>',
			noremap = false,
			desc = 'Reset git hunk',
		},
		{
			'<leader>gu',
			'<cmd>lua require"gitsigns".reset_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>)',
			noremap = false,
			mode = 'v',
			desc = 'Reset git hunk',
		},
		{
			'<leader>gU',
			'<cmd>lua require"gitsigns".undo_stage_hunk()<CR>',
			mode = { 'n', 'v' },
			noremap = false,
			desc = 'Unstage hunk',
		},
		{ '<leader>gb', '<cmd>lua require"gitsigns".blame_linefull=true<CR>', desc = 'Git blame line' },
	},
	dependencies = {
		'nvim-lua/plenary.nvim',
	},
	opts = {
		current_line_blame = true,
		current_line_blame_opts = {
			delay = 250,
		},
	},
}
