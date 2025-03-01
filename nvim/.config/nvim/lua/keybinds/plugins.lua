return {
	aerial = {
		{ '<leader>s', '<cmd>AerialToggle<CR>', desc = 'Open Buffer Outline Window' },
		{ '<leader>S', '<cmd>AerialNavToggle<CR>', desc = 'Open Buffer Outline Window (Floating)' },
	},

	bufferline = {
		{ '<A-]>', '<cmd>BufferLineCycleNext<CR>', desc = 'Go to next buffer' },
		{ '<A-[>', '<cmd>BufferLineCyclePrev<CR>', desc = 'Go to previous buffer' },
		{ '<C-w>d', '<cmd>BufferLineCloseOthers<CR>', desc = 'Close other buffers' },
	},

	codecompanion = {
		{ '<leader>ca', '<cmd>CodeCompanionActions<CR>', mode = { 'n', 'v' }, desc = 'Open CodeCompanion actions' },
		{ '<leader>cq', '<cmd>CodeCompanion<CR>', mode = { 'n', 'v' }, desc = 'Open CodeCompanion prompt' },
		{ '<leader>co', '<cmd>CodeCompanionChat<CR>', mode = { 'n', 'v' }, desc = 'Open CodeCompanion chat' },
	},

	flash = {
		{ 's', mode = { 'n', 'x', 'o' }, function() require('flash').jump() end, desc = 'Flash' },
		{ 'S', mode = { 'n', 'x', 'o' }, function() require('flash').treesitter() end, desc = 'Flash Treesitter' },
		{ 'r', mode = 'o', function() require('flash').remote() end, desc = 'Remote Flash' },
		{ 'R', mode = { 'o', 'x' }, function() require('flash').treesitter_search() end, desc = 'Treesitter Search' },
		{ '<c-s>', mode = { 'c' }, function() require('flash').toggle() end, desc = 'Toggle Flash Search' },
	},

	['mini.files'] = {
		{ '<C-b>', '<cmd>lua require("mini.files").open()<CR>', desc = 'Open file browser' },
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
		{ '<leader>tb', '<cmd>lua require("telescope.builtin").buffers()<CR>', desc = 'Telescope buffers' },
		{ '<leader>tf', '<cmd>Telescope find_files<CR>', desc = 'Telescope find files' },
		{ '<leader>tF', '<cmd>Telescope find_files hidden=true no_ignore=true<CR>', desc = 'Telescope find all files' },
		{ '<leader>th', '<cmd>lua require("telescope.builtin").oldfiles()<CR>', desc = 'Telescope histories' },
		{ '<leader>to', '<cmd>TodoTelescope<CR>', desc = 'Telescope todo' },
		{ '<leader>tq', '<cmd>lua require("telescope.builtin").quickfix()<CR>', desc = 'Telescope quickfix' },
		{ '<leader>tw', '<cmd>lua require("telescope.builtin").live_grep()<CR>', desc = 'Telescope grep' },
	},

	trouble = {
		{ '<leader>xa', '<cmd>Trouble diagnostics toggle<CR>', desc = 'Toggle trouble diagnostics' },
		{ '<leader>xd', '<cmd>Trouble diagnostics toggle filter.buf=0<CR>', desc = 'Toggle trouble diagnostics for current buffer' },
		{ '<leader>xo', '<cmd>Trouble todo<CR>', desc = 'Open todo trouble' },
		{ '<leader>xx', '<cmd>Trouble close<CR>', desc = 'Close trouble' },
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