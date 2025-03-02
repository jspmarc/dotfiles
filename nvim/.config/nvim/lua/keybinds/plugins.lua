return {
	aerial = {
		{ '<leader>s', '<cmd>AerialToggle<CR>',    desc = 'Open Buffer Outline Window' },
		{ '<leader>S', '<cmd>AerialNavToggle<CR>', desc = 'Open Buffer Outline Window (Floating)' },
	},

	bufferline = {
		{ '<A-]>',  '<cmd>BufferLineCycleNext<CR>',   desc = 'Go to next buffer' },
		{ '<A-[>',  '<cmd>BufferLineCyclePrev<CR>',   desc = 'Go to previous buffer' },
		{ '<C-w>d', '<cmd>BufferLineCloseOthers<CR>', desc = 'Close other buffers' },
	},

	codecompanion = {
		{ '<leader>ca', '<cmd>CodeCompanionActions<CR>', mode = { 'n', 'v' }, desc = 'Open CodeCompanion actions' },
		{ '<leader>cq', '<cmd>CodeCompanion<CR>',        mode = { 'n', 'v' }, desc = 'Open CodeCompanion prompt' },
		{ '<leader>co', '<cmd>CodeCompanionChat<CR>',    mode = { 'n', 'v' }, desc = 'Open CodeCompanion chat' },
	},

	flash = {
		{
			's',
			mode = { 'n', 'x', 'o' },
			function()
				require('flash').jump()
			end,
			desc = 'Flash',
		},
		{
			'S',
			mode = { 'n', 'x', 'o' },
			function()
				require('flash').treesitter()
			end,
			desc = 'Flash Treesitter',
		},
		{
			'r',
			mode = 'o',
			function()
				require('flash').remote()
			end,
			desc = 'Remote Flash',
		},
		{
			'R',
			mode = { 'o', 'x' },
			function()
				require('flash').treesitter_search()
			end,
			desc = 'Treesitter Search',
		},
		{
			'<c-s>',
			mode = { 'c' },
			function()
				require('flash').toggle()
			end,
			desc = 'Toggle Flash Search',
		},
	},

	['mini.files'] = {
		{
			'<C-b>',
			function()
				require('mini.files').open()
			end,
			desc = 'Open file browser',
		},
		{
			'-',
			function()
				local mini_files = require('mini.files')
				local buf_name = vim.api.nvim_buf_get_name(0)
				local path = vim.fn.filereadable(buf_name) == 1 and buf_name or vim.fn.getcwd()
				mini_files.open(path)
				mini_files.reveal_cwd()
			end,
			desc = 'Open file browser',
		},
	},

	gitsigns = {
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

	neogit = {
		{ '<leader>gp', ':Neogit push<CR>',   desc = 'Git push' },
		{ '<leader>gc', ':Neogit commit<CR>', desc = 'Git commit' },
		{ '<leader>gl', ':Neogit pull<CR>',   desc = 'Git pull' },
	},

	snacks = {
		{
			'<leader>gg',
			function()
				require('snacks').lazygit.open()
			end,
			desc = 'Open lazy git',
		},
	},

	sneak = {
		{ 's', '<Plug>Sneak_s', mode = { 'n', 'x' }, desc = 'Sneak s' },
		{ 'S', '<Plug>Sneak_S', mode = { 'n', 'x' }, desc = 'Sneak S' },
		{ 'f', '<Plug>Sneak_f', mode = { 'n', 'x' }, desc = 'Sneak f' },
		{ 'F', '<Plug>Sneak_F', mode = { 'n', 'x' }, desc = 'Sneak F' },
		{ 't', '<Plug>Sneak_t', mode = { 'n', 'x' }, desc = 'Sneak t' },
		{ 'T', '<Plug>Sneak_T', mode = { 'n', 'x' }, desc = 'Sneak T' },
	},

	telescope = {
		{
			'<leader>tb',
			function()
				require('telescope.builtin').buffers()
			end,
			desc = 'Telescope buffers',
		},
		{ '<leader>tf', '<cmd>Telescope find_files<CR>',                            desc = 'Telescope find files' },
		{ '<leader>tF', '<cmd>Telescope find_files hidden=true no_ignore=true<CR>', desc = 'Telescope find all files' },
		{
			'<leader>th',
			function()
				require('telescope.builtin').oldfiles()
			end,
			desc = 'Telescope histories',
		},
		{ '<leader>to', '<cmd>TodoTelescope<CR>', desc = 'Telescope todo' },
		{
			'<leader>tq',
			function()
				require('telescope.builtin').quickfix()
			end,
			desc = 'Telescope quickfix',
		},
		{
			'<leader>tw',
			function()
				require('telescope.builtin').live_grep()
			end,
			desc = 'Telescope grep',
		},
	},

	trouble = {
		{ '<leader>xa', '<cmd>Trouble diagnostics toggle<CR>', desc = 'Toggle trouble diagnostics' },
		{
			'<leader>xd',
			'<cmd>Trouble diagnostics toggle filter.buf=0<CR>',
			desc = 'Toggle trouble diagnostics for current buffer',
		},
		{ '<leader>xo', '<cmd>Trouble todo<CR>',               desc = 'Open todo trouble' },
		{ '<leader>xx', '<cmd>Trouble close<CR>',              desc = 'Close trouble' },
	},

	['which-key'] = {
		{
			'<leader>?',
			function()
				require('which-key').show({ global = true })
			end,
			desc = 'Buffer Local Keymaps (which-key)',
		},
	},
}
