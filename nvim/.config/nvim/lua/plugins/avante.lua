return {
	enabled = false,
	'yetone/avante.nvim',
	cmd = {
		'AvanteAsk',
		'AvanteBuild',
		'AvanteChat',
		'AvanteEdit',
		'AvanteFocus',
		'AvanteRefresh',
		'AvanteSwitchFileSelectorProvider',
		'AvanteSwitchProvider',
		'AvanteShowRepoMap',
		'AvanteToggle',
	},
	keys = function(_, keys)
		local mappings = require('keybinds.plugins').avante
		mappings = vim.tbl_filter(function(m)
			return m[1] and #m[1] > 0
		end, mappings)
		return vim.list_extend(mappings, keys)
	end,
	opts = {
		provider = 'copilot',
		mode = 'agentic',
		providers = {
			copilot = {
				endpoint = 'https://api.githubcopilot.com',
				model = 'claude-sonnet-4',
				disable_tools = false,
				extra_request_body = {
					temperature = 0.75,
					max_tokens = 20480,
				},
			},
		},

		behaviour = {
			auto_suggestions = false, -- Experimental stage
			auto_set_highlight_group = true,
			auto_set_keymaps = true,
			auto_apply_diff_after_generation = false,
			support_paste_from_clipboard = true,
			minimize_diff = true, -- Whether to remove unchanged lines when applying a code block
			enable_token_counting = true, -- Whether to enable token counting. Default to true.
			enable_cursor_planning_mode = false, -- Whether to enable Cursor Planning Mode. Default to false.
		},
		suggestion = {
			debounce = 600,
			throttle = 600,
		},
	},
	build = 'make',
	dependencies = {
		'nvim-treesitter/nvim-treesitter',
		'folke/snacks.nvim',
		'nvim-lua/plenary.nvim',
		'MunifTanjim/nui.nvim',
		'nvim-telescope/telescope.nvim',
		'hrsh7th/nvim-cmp',
		'nvim-tree/nvim-web-devicons',
		'MeanderingProgrammer/render-markdown.nvim',
		'zbirenbaum/copilot.lua',
	},
}
