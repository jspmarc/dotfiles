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
		provider = 'openrouter',
		mode = 'agentic',
		providers = {
			openrouter = {
				__inherited_from = 'openai',
				endpoint = 'https://openrouter.ai/api/v1',
				api_key_name = 'OPENROUTER_API_KEY',
				model = 'z-ai/glm-4.6',
			},
			ollama = {
				endpoint = 'http://192.168.0.7:30068',
				model = 'qwen2.5-coder:7b',
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
