-- Function to open the Avante command menu
local function open_avante_command_menu()
	-- Define the Avante commands
	local avante_commands = {
		{
			function()
				require('avante.api').ask()
			end,
			'Ask AI about code',
		},
		{
			function()
				vim.cmd('AvanteChat')
			end,
			'Start a chat session with AI about the codebase',
		},
		{
			function()
				require('avante.api').refresh()
			end,
			'Refresh all Avante windows',
		},
		{
			function()
				require('avante.model_selector').open()
			end,
			'Switch AI Provider',
		},
		{
			function()
				vim.cmd('AvanteShowRepoMap')
			end,
			'Show the repository map',
		},
		{
			function()
				require('avante.api').toggle()
			end,
			'Toggle the chat panel',
		},
	}

	local options = vim.tbl_map(function(cmd)
		return cmd[2] -- Display text
	end, avante_commands)

	local function callback(choice)
		-- This function is called when the user makes a selection
		if not choice then
			return
		end

		-- Find the corresponding command
		local command = vim.tbl_filter(function(cmd)
			return cmd[2] == choice
		end, avante_commands)[1]
		if command then
			command[1]() -- Execute the command
		end
	end

	-- Call the ui.select menu
	vim.ui.select(options, { prompt = 'Avante Function: ' }, callback)
end

local timeout = 30000 -- 30 seconds

return {
	enabled = require('helpers').not_vscode,
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
		local mappings = {
			{
				'<leader>co',
				function()
					require('avante.api').ask()
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
				'<leader>ca', -- New key binding to open the selection box
				function()
					open_avante_command_menu()
				end,
				desc = 'avante: open command menu',
				mode = 'n',
			},
		}
		mappings = vim.tbl_filter(function(m)
			return m[1] and #m[1] > 0
		end, mappings)
		return vim.list_extend(mappings, keys)
	end,
	opts = {
		provider = 'openrouter-gemini-flash-2.0-lite',
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
				model = 'anthropic/claude-3.5-haiku-20241022',
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
