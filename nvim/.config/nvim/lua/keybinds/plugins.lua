return {
	aerial = {
		{ '<leader>s', '<cmd>AerialToggle<CR>',    desc = 'Open Buffer Outline Window' },
		{ '<leader>S', '<cmd>AerialNavToggle<CR>', desc = 'Open Buffer Outline Window (Floating)' },
	},

	avante = {
		{
			'<leader>ca',
			function()
				vim.ui.input({ prompt = 'Ask a question: ' }, function(question)
					if not question or question == '' then
						return
					end

					require('avante.api').ask({
						question = question,
					})
				end)
			end,
			desc = 'avante: ask',
			mode = { 'n', 'v' },
		},
		{
			'<leader>cr',
			function()
				require('avante.api').refresh()
			end,
			desc = 'avante: refresh',
			mode = 'v',
		},
		{
			'<leader>cb',
			function()
				require('avante.api').edit()
			end,
			desc = 'avante: edit',
			mode = { 'v' },
		},
		{
			'<leader>cl',
			function()
				require('avante.api').toggle()
			end,
			desc = 'avante: toggle chat panel',
			mode = { 'n', 'v' },
		},
		{
			'<leader>co', -- New key binding to open the selection box
			function()
				require('helpers').open_avante_command_menu()
			end,
			desc = 'avante: open command menu',
			mode = 'n',
		},
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
		{
			'<leader>cl',
			'<cmd>CodeCompanionChat toggle<CR>',
			mode = { 'n', 'v' },
			desc = 'Toggle CodeCompanion chat buffer',
		},
	},

	copilot = {
		{
			'<Tab>',
			function()
				local copilot_suggestion = require('copilot.suggestion')
				if copilot_suggestion.is_visible() then
					copilot_suggestion.accept()
				else
					vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<Tab>', true, false, true), 'n', false)
				end
			end,
			desc = 'Accept inline suggestion',
			mode = { 'i', 'n' },
		},
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

	grug = {
		{ '<leader>ff', '<cmd>GrugFar<CR>', desc = 'open GrugFar' },
		{
			'<leader>ff',
			function()
				require('grug-far').with_visual_selection()
			end,
			mode = { 'v' },
			desc = 'open GrugFar with current visual selection',
		},
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
		{ 's', '<Plug>Sneak_s', mode = { 'n' },      desc = 'Sneak s' },
		{ 'S', '<Plug>Sneak_S', mode = { 'n' },      desc = 'Sneak S' },
		{ 'z', '<Plug>Sneak_s', mode = { 'x' },      desc = 'Sneak s' },
		{ 'Z', '<Plug>Sneak_S', mode = { 'x' },      desc = 'Sneak S' },
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

	telescope_lsp = {
		{
			'gd',
			function()
				require('telescope.builtin').lsp_definitions()
			end,
			desc = 'LSP definitions',
		},
		{
			'gi',
			function()
				require('telescope.builtin').lsp_implementations()
			end,
			desc = 'LSP implementations',
		},
		{
			'gr',
			function()
				require('telescope.builtin').lsp_references()
			end,
			desc = 'LSP references',
		},
		{
			'<leader>ld',
			function()
				require('telescope.builtin').diagnostics({ bufnr = 0 })
			end,
			desc = 'LSP buffer diagnostics',
		},
		{
			'<leader>lD',
			function()
				require('telescope.builtin').diagnostics()
			end,
			desc = 'LSP workspace diagnostics',
		},
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
