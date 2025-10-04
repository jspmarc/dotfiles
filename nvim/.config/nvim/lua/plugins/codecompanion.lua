local plugin_keys = require('keybinds.plugins')

return {
	enabled = require('helpers').not_vscode,
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
				adapter = 'openrouter',
				model = 'qwen/qwen3-coder-plus',
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
				adapter = 'openrouter',
				model = 'google/gemini-2.5-flash',
			},
			agent = {
				adapter = 'openrouter',
				model = 'google/gemini-2.5-pro',
			},
		},
		adapters = {
			http = {
				ollama = function()
					return require('codecompanion.adapters').extend('openai_compatible', {
						env = {
							url = 'http://192.168.0.7:30068',
							chat_url = '/v1/chat/completions',
						},
						schema = {
							model = {
								default = 'qwen2.5-coder:7b',
								choices = {
									'qwen2.5-coder:7b',
									'qwen2.5-coder:0.3b',
									'deepseek-coder:6.7b',
								},
							},
						},
					})
				end,
				openrouter = function()
					return require('codecompanion.adapters').extend('openai_compatible', {
						env = {
							url = 'https://openrouter.ai/api',
							api_key = 'OPENROUTER_API_KEY',
							chat_url = '/v1/chat/completions',
						},
						schema = {
							model = {
								default = 'qwen/qwen3-coder-plus',
								choices = {
									'qwen/qwen3-coder-flash',
									'qwen/qwen3-coder-plus',
									'qwen/qwen-2.5-coder-32b-instruct',
									'anthropic/claude-sonnet-4',
									'anthropic/claude-sonnet-4.5',
									'anthropic/claude-opus-4.1',
									'google/gemini-2.5-pro',
									'google/gemini-2.5-flash',
									'openai/gpt-5',
									'openai/gpt-5-mini',
								},
							},
						},
					})
				end,
			},
			acp = {
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
		}, -- Optional: to add context to the chat buffer
		'j-hui/fidget.nvim', -- Optional: For the fidget spinner
		'hrsh7th/nvim-cmp', -- Optional: For using slash commands and variables in the chat buffer
		'nvim-telescope/telescope.nvim', -- Optional: For using slash commands
		'folke/snacks.nvim', -- Optional: Improves `vim.ui.select`
	},
}
