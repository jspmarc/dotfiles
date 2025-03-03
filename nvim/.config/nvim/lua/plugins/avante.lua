local timeout = 30000 -- 30 seconds

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
		provider = 'openrouter-qwen2.5-coder',
		cursor_planning_provider = 'gemini-flash-2.0-lite',
		auto_suggestions_provider = 'openrouter-qwen2.5-coder-free',
		vendors = {
			-- ollama
			['ollama-llama3.1-8b'] = {
				__inherited_from = 'openai',
				endpoint = 'http://127.0.0.1:11434/v1',
				api_key_name = '',
				model = 'llama3.1:8b-instruct-q8_0',
				disable_tools = true,
			},
			['ollama-deepseek-r1-14b'] = {
				__inherited_from = 'openai',
				endpoint = 'http://127.0.0.1:11434/v1',
				api_key_name = '',
				model = 'deepseek-r1:14b',
				disable_tools = true,
			},

			-- openrouter
			['openrouter-deepseek-r1'] = {
				__inherited_from = 'openai',
				endpoint = 'https://openrouter.ai/api/v1',
				api_key_name = 'OPENROUTER_API_KEY',
				model = 'deepseek/deepseek-r1-distill-llama-8b',
				disable_tools = true,
				timeout = timeout,
			},
			['openrouter-deepseek-v3'] = {
				__inherited_from = 'openai',
				endpoint = 'https://openrouter.ai/api/v1',
				api_key_name = 'OPENROUTER_API_KEY',
				model = 'deepseek/deepseek-chat:free',
				disable_tools = true,
				timeout = timeout,
			},
			['openrouter-qwen2.5-coder-free'] = {
				__inherited_from = 'openai',
				endpoint = 'https://openrouter.ai/api/v1',
				api_key_name = 'OPENROUTER_API_KEY',
				model = 'qwen/qwen-2.5-coder-32b-instruct:free',
				disable_tools = true,
				timeout = timeout,
			},
			['openrouter-qwen2.5-coder'] = {
				__inherited_from = 'openai',
				endpoint = 'https://openrouter.ai/api/v1',
				api_key_name = 'OPENROUTER_API_KEY',
				model = 'qwen/qwen-2.5-coder-32b-instruct',
				disable_tools = true,
				timeout = timeout,
			},
			['openrouter-claude-3.5-haiku'] = {
				__inherited_from = 'openai',
				endpoint = 'https://openrouter.ai/api/v1',
				api_key_name = 'OPENROUTER_API_KEY',
				model = 'anthropic/claude-3.5-haiku',
				timeout = timeout,
				max_tokens = 49152,
			},
			['openrouter-gemini-flash-2.0-lite'] = {
				__inherited_from = 'openai',
				endpoint = 'https://openrouter.ai/api/v1',
				api_key_name = 'OPENROUTER_API_KEY',
				model = 'google/gemini-2.0-flash-lite-001',
				timeout = timeout,
				max_tokens = 65536,
			},
			['openrouter-gemini-flash-2.0'] = {
				__inherited_from = 'openai',
				endpoint = 'https://openrouter.ai/api/v1',
				api_key_name = 'OPENROUTER_API_KEY',
				model = 'google/gemini-2.0-flash-001',
				timeout = timeout,
				max_tokens = 65536,
			},
		},
		behaviour = {
			auto_suggestions = false, -- Experimental stage
			auto_set_highlight_group = true,
			auto_set_keymaps = true,
			auto_apply_diff_after_generation = false,
			support_paste_from_clipboard = true,
			minimize_diff = true,      -- Whether to remove unchanged lines when applying a code block
			enable_token_counting = true, -- Whether to enable token counting. Default to true.
			enable_cursor_planning_mode = true, -- Whether to enable Cursor Planning Mode. Default to false.
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
	},
}
