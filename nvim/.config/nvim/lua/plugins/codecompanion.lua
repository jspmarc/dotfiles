local plugin_keys = require('keybinds.plugins')

return {
	enabled = false,
	'olimorris/codecompanion.nvim',
	cmd = {
		'CodeCompanion',
		'CodeCompanionChat',
		'CodeCompanionCmd',
		'CodeCompanionActions',
	},
	keys = plugin_keys.codecompanion,
	opts = {
		strategies = {
			chat = {
				adapter = 'copilot-claude-3.5',
				slash_commands = {
					buffer = {
						opts = {
							provider = 'snacks', -- Other options include 'default', 'mini_pick', 'fzf_lua', snacks
							contains_code = true,
						},
					},
					file = {
						opts = {
							provider = 'snacks', -- Other options include 'default', 'mini_pick', 'fzf_lua', snacks
							contains_code = true,
						},
					},
					help = {
						opts = {
							provider = 'snacks', -- Other options include 'default', 'mini_pick', 'fzf_lua', snacks
							contains_code = true,
						},
					},
					symbols = {
						opts = {
							provider = 'snacks', -- Other options include 'default', 'mini_pick', 'fzf_lua', snacks
							contains_code = true,
						},
					},
				},
			},
			inline = {
				adapter = 'copilot-claude-3.5',
			},
			agent = {
				adapter = 'copilot-claude-3.5',
			},
		},
		adapters = {
			openrouter = function()
				return require('codecompanion.adapters').extend('openai_compatible', {
					env = {
						url = 'https://openrouter.ai/api',
						api_key = 'OPENROUTER_API_KEY',
						chat_url = '/v1/chat/completions',
					},
					schema = {
						model = {
							default = 'qwen/qwen-2.5-coder-32b-instruct',
							choices = {
								'deepseek/deepseek-r1-distill-llama-8b',
								'deepseek/deepseek-chat:free',
								'qwen/qwen-2.5-coder-32b-instruct:free',
								'qwen/qwen-2.5-coder-32b-instruct',
								'anthropic/claude-3.5-haiku',
								'anthropic/claude-3.5-sonnet',
								'anthropic/claude-3.7-sonnet',
								'google/gemini-2.0-flash-lite-001',
								'google/gemini-2.0-flash-001',
							},
						},
					},
				})
			end,
			['copilot-claude-3.5'] = function()
				return require('codecompanion.adapters').extend('copilot', {
					schema = {
						model = {
							default = 'claude-3.5-sonnet',
						},
					},
				})
			end,
		},
		display = {
			chat = {
				window = {
					layout = 'vertical',
					position = 'right',
					width = 0.25,
				},
			},
		},
	},
	init = function()
		require('plugins.codecompanion.fidget'):init()
	end,
	dependencies = {
		'github/copilot.vim',
		'nvim-lua/plenary.nvim',
		'nvim-treesitter/nvim-treesitter',
		{
			'0xrusowsky/nvim-ctx-ingest',
			cmd = { 'CtxIngest' },
			keys = plugin_keys.ctx_ingest,
			dependencies = {
				'nvim-web-devicons', -- required for file icons
			},
			config = function()
				require('nvim-ctx-ingest').setup({
					-- your config options here
				})
			end,
		},                         -- Optional: to add context to the chat buffer
		'j-hui/fidget.nvim',       -- Optional: For the fidget spinner
		'hrsh7th/nvim-cmp',        -- Optional: For using slash commands and variables in the chat buffer
		'nvim-telescope/telescope.nvim', -- Optional: For using slash commands
		'folke/snacks.nvim',       -- Optional: Improves `vim.ui.select`
	},
}
