local plugin_keys = require('keybinds.plugins')

return {
	enabled = false,
	'olimorris/codecompanion.nvim',
	cmd = {
		'CodeCompanion',
		'CodeCompanionChat',
		'CodeCompanionCmd',
		'CodeCompanionActions',
		'CodeCompanionHistory',
		'CodeCompanionSummaries',
	},
	keys = plugin_keys.codecompanion,
	opts = {
		strategies = {
			chat = {
				adapter = 'openrouter',
				model = 'z-ai/glm-4.6',
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
				model = 'z-ai/glm-4.6',
			},
			agent = {
				adapter = 'openrouter',
				model = 'anthropic/claude-sonnet-4.5',
			},
		},
		adapters = {
			http = {
				ollama = function()
					return require('codecompanion.adapters').extend('openai_compatible', {
						env = {
							url = 'http://mnemosyne.box:30068',
							chat_url = '/v1/chat/completions',
						},
						schema = {
							model = {
								default = 'qwen2.5-coder:3b',
								choices = {
									'qwen2.5-coder:7b',
									'qwen2.5-coder:3b',
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
								default = 'z-ai/glm-4.6',
								choices = {
									'moonshotai/kimi-k2-thinking',
									'qwen/qwen3-coder-plus',
									'anthropic/claude-sonnet-4.5',
									'anthropic/claude-haiku-4.5',
									'google/gemini-2.5-pro',
									'google/gemini-2.5-flash',
									'openai/gpt-5',
									'openai/gpt-5-mini',
									'z-ai/glm-4.6',
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
		extensions = {
			history = {
				enabled = true,
				opts = {
					-- Keymap to open history from chat buffer (default: gh)
					keymap = 'gh',
					-- Save all chats by default (disable to save only manually using 'sc')
					auto_save = true,
					-- Picker interface (auto resolved to a valid picker)
					picker = 'snacks', --- ('telescope', 'snacks', 'fzf-lua', or 'default')
					chat_filter = function(chat_data)
						return chat_data.cwd == vim.fn.getcwd()
					end,
					-- Customize picker keymaps (optional)
					picker_keymaps = {
						rename = { n = 'r', i = '<M-r>' },
						delete = { n = 'd', i = '<M-d>' },
						duplicate = { n = '<C-y>', i = '<C-y>' },
					},
					auto_generate_title = true,
					title_generation_opts = {
						adapter = 'openrouter',
						model = 'qwen/qwen3-coder-30b-a3b-instruct',
						-- adapter = 'ollama',
						-- model = 'qwen2.5-coder:3b',
						refresh_every_n_prompts = 10,
					},
					---When chat is cleared with `gx` delete the chat from history
					delete_on_clearing_chat = true,

					-- Summary system
					summary = {
						-- Keymap to generate summary for current chat (default: 'gcs')
						create_summary_keymap = 'gcs',
						-- Keymap to browse summaries (default: 'gbs')
						browse_summaries_keymap = 'gbs',

						generation_opts = {
							adapter = 'openrouter',
							model = 'qwen/qwen3-coder-30b-a3b-instruct',
							-- adapter = 'ollama',
							-- model = 'qwen2.5-coder:3b',
							context_size = 90000, -- max tokens that the model supports
							include_references = true, -- include slash command content
							include_tool_outputs = true, -- include tool execution results
							system_prompt = nil, -- custom system prompt (string or function)
							format_summary = nil, -- custom function to format generated summary e.g to remove <think/> tags from summary
						},
					},
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
		'ravitemer/codecompanion-history.nvim',
	},
}
