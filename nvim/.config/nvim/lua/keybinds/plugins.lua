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
			'<leader>ch',
			function()
				require('avante.api').select_history()
			end,
			desc = 'avante: select from history',
			mode = 'n',
		},
		{
			'<leader>cl',
			function()
				require('avante.api').toggle()
			end,
			desc = 'avante: toggle chat panel',
			mode = 'n',
		},
		{
			'<leader>cm',
			function()
				require('avante.model_selector').open()
			end,
			desc = 'avante: select AI provider',
			mode = 'n',
		},
		{
			'<leader>cn',
			function()
				require('avante.api').ask({ new_chat = true })
			end,
			desc = 'avante: start a new chat',
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
		{ '<leader>ch', '<cmd>CodeCompanionHistory<CR>', mode = 'n',          desc = 'Open CodeCompanion chat histories' },
		{ '<leader>co', '<cmd>CodeCompanionChat<CR>',    mode = { 'n', 'v' }, desc = 'Open CodeCompanion chat' },
		{
			'<leader>cl',
			'<cmd>CodeCompanionChat toggle<CR>',
			mode = { 'n', 'v' },
			desc = 'Toggle CodeCompanion chat buffer',
		},
		{ '<leader>cs', '<cmd>CodeCompanionSummaries<CR>', mode = { 'n', 'v' }, desc = 'Open CodeCompanion chat summaries' },
		{ '<leader>cq', '<cmd>CodeCompanion<CR>',          mode = { 'n', 'v' }, desc = 'Open CodeCompanion prompt' },
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

	ctx_ingest = {
		{ '<leader>cf', '<cmd>CtxIngest<CR>', desc = 'Open Ctx Ingest (file picker to share with LLM)' },
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

	fugitive = {
		{ '<leader>gB', '<cmd>G blame<CR>', desc = 'Open blame panel' },
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
				vim.defer_fn(function()
					mini_files.reveal_cwd()
				end, 100)
			end,
			desc = 'Open file browser',
		},
	},

	gitsigns = {
		{
			'<leader>gh',
			function()
				require('gitsigns').preview_hunk()
			end,
			noremap = false,
			desc = 'Preview git hunk',
		},
		{
			'<leader>gs',
			function()
				require('gitsigns').stage_hunk()
			end,
			noremap = false,
			desc = 'Stage git hunk',
		},
		{
			'<leader>gs',
			function()
				require('gitsigns').stage_hunk({ vim.fn.line('.'), vim.fn.line('v') })
			end,
			noremap = false,
			mode = 'v',
			desc = 'Stage git hunk',
		},
		{
			'<leader>g]',
			function()
				require('gitsigns').next_hunk()
			end,
			noremap = false,
			desc = 'Go to next git hunk',
		},
		{
			'<leader>g[',
			function()
				require('gitsigns').prev_hunk()
			end,
			noremap = false,
			desc = 'Previous go to previous git hunk',
		},
		{
			'<leader>gu',
			function()
				require('gitsigns').reset_hunk()
			end,
			noremap = false,
			desc = 'Reset git hunk',
		},
		{
			'<leader>gu',
			function()
				require('gitsigns').reset_hunk({ vim.fn.line('.'), vim.fn.line('v') })
			end,
			noremap = false,
			mode = 'v',
			desc = 'Reset git hunk',
		},
		{
			'<leader>gU',
			function()
				require('gitsigns').undo_stage_hunk()
			end,
			mode = { 'n', 'v' },
			noremap = false,
			desc = 'Unstage hunk',
		},
		{
			'<leader>gb',
			function()
				require('gitsigns').blame_line({ full = true })
			end,
			desc = 'Git blame line',
		},
		{
			'<leader>gB',
			function()
				require('gitsigns').blame()
			end,
			desc = 'Open fugitive blame',
		},
	},

	grug = {
		{ '<leader>//', '<cmd>GrugFar<CR>', desc = 'open GrugFar' },
		{
			'<leader>//',
			function()
				require('grug-far').with_visual_selection()
			end,
			mode = { 'v' },
			desc = 'open GrugFar with current visual selection',
		},
	},

	opencode = {
		{
			'<leader>ca',
			function() require("opencode").ask("@this: ", { submit = true }) end,
			desc = 'Ask opencode',
			mode = { 'n', 'x' },
		},
		{
			'ga',
			function() require("opencode").prompt("@this") end,
			desc = 'Add to opencode',
			mode = { 'n', 'x' },
		},
		{
			'<leader>cl',
			function() require("opencode").toggle() end,
			desc = 'Toggle opencode',
			mode = { 'n', 't' },
		},
		{
			'<leader>co',
			function() require("opencode").select() end,
			desc = "Execute opencode action…",
			mode = { "n", "x" },
		},
		{
			'<S-C-u>',
			function() require("opencode").command("session.half.page.up") end,
			desc = 'opencode half page up',
			mode = { 'n', 't' },
		},
		{
			'<S-C-d>',
			function() require("opencode").command("session.half.page.down") end,
			desc = 'opencode half page down',
			mode = { 'n', 't' },
		},
	},

	session_manager = {
		{
			'<leader>pp',
			function()
				require('session_manager').load_session()
			end,
			desc = 'Load sessions',
		},
		{
			'<leader>pr',
			function()
				require('session_manager').load_last_session()
			end,
			desc = 'Load last session',
		},
		{
			'<leader>pg',
			function()
				require('session_manager').load_git_session()
			end,
			desc = 'Load sessions with git',
		},
		{
			'<leader>pd',
			function()
				require('session_manager').delete_session()
			end,
			desc = 'Delete session',
		},
		{
			'<leader>pD',
			function()
				require('session_manager').delete_current_dir_session()
			end,
			desc = 'Delete current dir session',
		},
	},

	snacks = {
		{
			'<leader>gg',
			function()
				Snacks.lazygit.open()
			end,
			desc = 'Open lazy git',
		},
		{
			'<leader>go',
			function()
				Snacks.gitbrowse.open()
			end,
			mode = { 'n', 'x' },
			desc = 'Open line in browser',
		},
		{
			'<leader>gy',
			function()
				Snacks.gitbrowse({ open = function(url) vim.fn.setreg("+", url) end, notify = false })
				vim.api.nvim_input("<Esc>")
			end,
			mode = { 'n', 'x' },
			desc = 'Copy line URL to clipboard',
		},

		-- bufdelete and scratch
		{
			'<leader>bd',
			function()
				Snacks.bufdelete()
			end,
			desc = 'Delete buffer',
		},
		{
			'<leader>bk',
			function()
				Snacks.bufdelete()
			end,
			desc = 'Delete buffer',
		},
		{
			'<C-w>c',
			function()
				Snacks.bufdelete.all()
			end,
			desc = 'Delete all buffers',
		},
		{
			'<C-w>d',
			function()
				Snacks.bufdelete.other()
			end,
			desc = 'Delete all buffers except current one',
		},
		{
			'<leader>bs',
			function()
				Snacks.scratch()
			end,
			desc = 'Toggle scratch buffer',
		},
		{
			'<leader>bS',
			function()
				Snacks.scratch.select()
			end,
			desc = 'Select scratch buffer',
		},

		-- picker
		{
			'<leader>bb',
			function()
				Snacks.picker.buffers()
			end,
			desc = 'Buffers picker',
		},
		{
			'<leader>ff',
			function()
				Snacks.picker.files({ cwd = vim.fn.getcwd(), hidden = false, ignored = false })
			end,
			desc = 'Find all files in cwd',
		},
		{
			'<leader>fF',
			function()
				Snacks.picker.files({ cwd = vim.fn.getcwd(), hidden = true, ignored = true })
			end,
			desc = 'Find all files (incl. hidden and ignored) in cwd',
		},
		{
			'<leader>fh',
			function()
				Snacks.picker.recent()
			end,
			desc = 'Find recent files',
		},
		{
			'<leader>fs',
			function()
				Snacks.picker.smart({ cwd_only = false })
			end,
			desc = 'Smart open file',
		},
		{
			'<leader>fr',
			function()
				Snacks.picker.pick('oldfiles')
			end,
			desc = 'Recent files',
		},
		{
			'<leader>to',
			function()
				Snacks.picker.todo_comments()
			end,
			desc = 'Snacks picker todo',
		},
		{
			'<leader>tq',
			function()
				Snacks.picker.qflist()
			end,
			desc = 'Snacks picker quickfix',
		},
		{
			'<leader>/s',
			function()
				Snacks.picker.pick('live_grep')
			end,
			desc = 'Search (live grep) current directory',
		},
	},

	snacks_lsp = {
		{
			'gd',
			function()
				Snacks.picker.lsp_definitions()
			end,
			desc = 'LSP definitions',
		},
		{
			'gi',
			function()
				Snacks.picker.lsp_implementations()
			end,
			desc = 'LSP implementations',
		},
		{
			'gr',
			function()
				Snacks.picker.lsp_references()
			end,
			desc = 'LSP references',
		},
		{
			'<leader>ld',
			function()
				Snacks.picker.diagnostics_buffer()
			end,
			desc = 'LSP buffer diagnostics',
		},
		{
			'<leader>lD',
			function()
				Snacks.picker.diagnostics()
			end,
			desc = 'LSP workspace diagnostics',
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
		{
			'<leader>tf',
			function()
				require('telescope.builtin').find_files({ cwd = vim.fn.getcwd(), hidden = true, no_ignore = true })
			end,
			desc = 'Telescope find all files',
		},
		{
			'<leader>ts',
			'<cmd>Telescope smart_open cwd_only=false<CR>',
			desc = 'Telescope Smart Open',
		},
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

	['tmux-navigator'] = {
		{ '<A-h>',  '<cmd>TmuxNavigateLeft<CR>' },
		{ '<A-j>',  '<cmd>TmuxNavigateDown<CR>' },
		{ '<A-k>',  '<cmd>TmuxNavigateUp<CR>' },
		{ '<A-l>',  '<cmd>TmuxNavigateRight<CR>' },
		{ '<A-\\>', '<cmd>TmuxNavigatePrevious<CR>' },
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
