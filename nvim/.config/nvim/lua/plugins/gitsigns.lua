return {
	'lewis6991/gitsigns.nvim',
	event = { 'BufReadPost' },
	keys = {
		{ '<leader>gh', '<cmd>lua require"gitsigns".preview_hunk()<CR>', noremap = false },
		{ '<leader>gs', '<cmd>lua require"gitsigns".stage_hunk()<CR>', noremap = false },
		{ '<leader>g]', '<cmd>lua require"gitsigns".next_hunk()<CR>', noremap = false },
		{ '<leader>g[', '<cmd>lua require"gitsigns".prev_hunk()<CR>', noremap = false },
		{
			'<leader>gs',
			'<cmd>lua require"gitsigns".stage_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>',
			noremap = false
		},
		{ '<leader>gu', '<cmd>lua require"gitsigns".reset_hunk()<CR>', noremap = false },
		{
			'<leader>gu',
			'<cmd>lua require"gitsigns".reset_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>)',
			noremap = false
		},
		{ '<leader>gU', '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>', noremap = false },
		{ '<leader>gU', '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>', { noremap = false } },
		{ '<leader>gb', '<cmd>lua require"gitsigns".blame_linefull=true<CR>' },
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
