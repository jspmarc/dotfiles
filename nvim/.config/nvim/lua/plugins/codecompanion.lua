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
				model = 'google/gemini-2.5-pro',
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
				model = 'google/gemini-2.5-flash-lite',
			},
			agent = {
				adapter = 'openrouter',
				model = 'openai/gpt-5',
			},
		},
		adapters = {
			http = {
				openrouter = function()
					return require('codecompanion.adapters').extend('openai_compatible', {
						env = {
							url = 'https://openrouter.ai/api',
							api_key = 'OPENROUTER_API_KEY',
							chat_url = '/v1/chat/completions',
						},
						schema = {
							model = {
								default = 'google/gemini-2.5-pro',
								choices = {
									'qwen/qwen3-coder-flash',
									'qwen/qwen3-coder-plus',
									'qwen/qwen3-coder-30b-a3b-instruct',
									'anthropic/claude-3.5-sonnet',
									'anthropic/claude-3.7-sonnet',
									'anthropic/claude-sonnet-4.5',
									'google/gemini-2.5-pro',
									'google/gemini-2.5-flash',
									'google/gemini-2.5-flash-lite',
									'openai/gpt-5',
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
