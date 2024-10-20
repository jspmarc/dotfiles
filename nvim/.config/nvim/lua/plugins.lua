local M = require('packer').startup(function(use)
	use('wbthomason/packer.nvim')

	-- sorted by plugin's name and then by author name
	-- `nvim` and `vim` prefix are treated as if they don't exist

	---------------------------------------------------------------------------
	---------------                     A                       ---------------
	---------------------------------------------------------------------------
	use({
		'windwp/nvim-autopairs',
		config = function()
			require('nvim-autopairs').setup()
		end,
	})

	---------------------------------------------------------------------------
	---------------                     B                       ---------------
	---------------------------------------------------------------------------
	use({
		'akinsho/bufferline.nvim',
		config = function()
			require('bufferline').setup({
				options = {
					diagnostics = 'nvim_lsp',
					offsets = { { filetype = 'NvimTree', text = 'File Explorer' } },
					separator_style = 'thick',
					numbers = function(opts)
						return string.format('%s%s', opts.id, opts.lower(opts.ordinal))
					end,
				},
			})
		end,
	})

	---------------------------------------------------------------------------
	---------------                     C                       ---------------
	---------------------------------------------------------------------------
	use('hrsh7th/cmp-nvim-lsp')
	use('hrsh7th/cmp-buffer')
	use('hrsh7th/cmp-path')
	use('hrsh7th/cmp-cmdline')
	use('hrsh7th/cmp-nvim-lsp-document-symbol')
	use('hrsh7th/cmp-nvim-lsp-signature-help')
	use('saadparwaiz1/cmp_luasnip')
	use({
		'hrsh7th/nvim-cmp',
		requires = {},
		config = function()
			local cmp = require('cmp')
			local cmp_autopairs = require('nvim-autopairs.completion.cmp')

			local kind_icons = {
				Text = '',
				Method = '',
				Function = '󰊕',
				Constructor = '',
				Field = '',
				Variable = '',
				Class = '',
				Interface = '',
				Module = '󰕳',
				Property = '',
				Unit = '',
				Value = '',
				Enum = '',
				Keyword = '',
				Snippet = '',
				Color = '',
				File = '',
				Reference = '',
				Folder = '',
				EnumMember = '',
				Constant = '',
				Struct = '',
				Event = '',
				Operator = '',
				TypeParameter = '',
			}

			cmp.setup({
				snippet = {
					expand = function(args)
						require('luasnip').lsp_expand(args.body)
					end,
				},
				mapping = {
					-- see :h mode() for 2nd arg of cmp.mapping
					['<C-j>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
					['<C-k>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
					['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
					['<C-e>'] = cmp.mapping({
						i = cmp.mapping.abort(),
						c = cmp.mapping.close(),
					}),
					['<CR>'] = cmp.mapping.confirm({
						behavior = cmp.ConfirmBehavior.Replace,
						select = true,
					}),
					['<Tab>'] = cmp.mapping.select_next_item(),
					['<S-Tab>'] = cmp.mapping.select_prev_item(),
				},
				sources = cmp.config.sources({
					{ name = 'copilot' },
					{ name = 'nvim_lsp' },
					{ name = 'luasnip' },
					{ name = 'path' },
					{ name = 'nvim_lsp_signature_help' },
				}, {
					{ name = 'buffer' },
				}),
				formatting = {
					format = function(entry, vim_item)
						-- Kind icons
						vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
						return vim_item
					end,
				},
			})

			cmp.setup.cmdline('/', {
				sources = cmp.config.sources({
					{ name = 'buffer' },
				}),
			})

			cmp.setup.cmdline(':', {
				sources = cmp.config.sources({
					{ name = 'path' },
				}, {
					{ name = 'cmdline' },
				}),
			})

			cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done({ map_char = { tex = '' } }))
		end,
	})
	use({
		'numToStr/Comment.nvim',
		config = function()
			require('Comment').setup({
				ignore = '^%s*$',
				pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
			})
		end,
	})
	use('github/copilot.vim')
	use({
		'CopilotC-Nvim/CopilotChat.nvim',
		config = function()
			require('CopilotChat.integrations.cmp').setup()

			local copilot_chat = require('CopilotChat')
			copilot_chat.setup({
				debug = false,
				show_help = 'yes',
				disable_extra_info = 'no',
				language = 'English',
				window = {
					layout = 'float',
					relative = 'cursor',
					width = 1,
					height = 0.4,
					row = 1,
				},
				build = function()
					vim.notify(
						"Please update the remote plugins by running ':UpdateRemotePlugins', then restart Neovim."
					)
				end,
				mappings = {
					complete = {
						insert = '',
					},
				},
				event = 'VeryLazy',
			})
		end,
		requires = {
			'nvim-telescope/telescope.nvim', -- Use telescope for help actions
			'nvim-lua/plenary.nvim',
		},
	})
	use('ap/vim-css-color')

	---------------------------------------------------------------------------
	---------------                     D                       ---------------
	---------------------------------------------------------------------------
	use({
		'glepnir/dashboard-nvim',
		event = 'VimEnter',
		config = function()
			require('dashboard').setup({})
		end,
		requires = { 'nvim-tree/nvim-web-devicons' },
	})
	use('ekalinin/Dockerfile.vim')
	use('stevearc/dressing.nvim')
	use({
		'mrshmllow/document-color.nvim',
		config = function()
			require('document-color').setup({
				-- Default options
				mode = 'background', -- "background" | "foreground" | "single"
			})
		end,
	})

	---------------------------------------------------------------------------
	---------------                     E                       ---------------
	---------------------------------------------------------------------------
	use('easymotion/vim-easymotion')
	use('houtsnip/vim-emacscommandline')
	use('editorconfig/editorconfig-vim')

	---------------------------------------------------------------------------
	---------------                     F                       ---------------
	---------------------------------------------------------------------------
	use({
		'j-hui/fidget.nvim',
		config = function()
			require('fidget').setup({})
		end,
	})
	use('tpope/vim-fugitive')
	-- use({ -- plugin for resizing window on window move
	-- 	'beauwilliams/focus.nvim',
	-- 	config = function()
	-- 		require('focus').setup()
	-- 	end,
	-- })

	---------------------------------------------------------------------------
	---------------                     G                       ---------------
	---------------------------------------------------------------------------
	use({
		'lewis6991/gitsigns.nvim',
		requires = {
			'nvim-lua/plenary.nvim',
		},
		config = function()
			require('gitsigns').setup({
				current_line_blame = true,
				current_line_blame_opts = {
					delay = 250,
				},
			})
		end,
	})

	---------------------------------------------------------------------------
	---------------                     I                       ---------------
	---------------------------------------------------------------------------
	use({
		'lukas-reineke/indent-blankline.nvim',
		config = function()
			require('ibl').setup({
				exclude = {
					filetypes = {
						'dashboard',
						'lsp-installer',
						'lspinfo',
						'packer',
						'checkhealth',
						'help',
						'man',
						'gitcommit',
						'TelescopePrompt',
						'TelescopeResults',
						'',
					},
				},
			})
		end,
	})

	---------------------------------------------------------------------------
	---------------                     L                       ---------------
	---------------------------------------------------------------------------
	use('neovim/nvim-lspconfig')
	use({
		'nvim-lualine/lualine.nvim',
		config = function()
			require('lualine').setup({
				options = {
					disabled_filetypes = { 'dashboard' },
					theme = 'onedark',
				},
				sections = {
					lualine_a = { 'mode' },
					lualine_b = { 'branch', 'diff' },
					lualine_c = {
						{
							'filename',
							file_status = true,
							path = 1,
						},
						{
							'diagnostics',
							sources = { 'nvim_diagnostic' },
						},
					},
					lualine_x = { 'encoding', 'fileformat' },
					lualine_y = { 'filetype' },
					lualine_z = { 'location' },
				},
			})
		end,
	})
	use({
		'L3MON4D3/LuaSnip',
		tag = 'v2.*',
		run = 'make install_jsregexp',
		requires = { 'rafamadriz/friendly-snippets' },
		config = function()
			require('luasnip.loaders.from_vscode').lazy_load()
		end,
	})

	---------------------------------------------------------------------------
	---------------                     M                       ---------------
	---------------------------------------------------------------------------
	use({ 'iamcco/markdown-preview.nvim', run = 'cd app && yarn install' })
	use({
		'williamboman/mason.nvim',
		config = function()
			require('mason').setup()
		end,
	})
	use({
		'williamboman/mason-lspconfig.nvim',
		requires = { 'williamboman/mason.nvim' },
		config = function()
			require('mason').setup()
			require('mason-lspconfig').setup({
				ensure_installed = require('helpers').lsp_servers,
			})
		end,
	})
	use({
		'jayp0521/mason-null-ls.nvim',
		requires = { 'williamboman/mason.nvim' },
		config = function()
			-- local helper = require('helpers')
			-- local things = vim.tbl_extend('error', helper.null_ls_formatters, helper.null_ls_linters)
			require('mason-null-ls').setup({
				automatic_setup = true,
				ensure_installed = vim.tbl_extend(
					'force',
					require('helpers').null_ls_formatters,
					require('helpers').null_ls_linters
				),
			})
		end,
	})
	use({
		'echasnovski/mini.files',
		branch = 'stable',
		config = function()
			require('mini.files').setup()
		end,
	})

	---------------------------------------------------------------------------
	---------------                     N                       ---------------
	---------------------------------------------------------------------------
	use('jbyuki/nabla.nvim')
	use({
		'danymat/neogen',
		config = function()
			require('neogen').setup({
				enabled = true,
				input_after_comment = false,
			})
		end,
		requires = 'nvim-treesitter/nvim-treesitter',
	})
	use({
		'NeogitOrg/neogit',
		requires = {
			'nvim-lua/plenary.nvim',
			'sindrets/diffview.nvim',
		},
		config = function()
			require('neogit').setup()
		end,
	})
	use({
		'karb94/neoscroll.nvim',
		config = function()
			require('neoscroll').setup({
				mappings = { '<C-u>', '<C-d>', '<C-u>', 'zz', 'zb', 'zt' },
			})
		end,
	})
	use('rcarriga/nvim-notify')
	use({
		'jose-elias-alvarez/null-ls.nvim',
		config = function()
			local null_ls = require('null-ls')
			null_ls.setup({
				sources = {
					-- code actions
					null_ls.builtins.code_actions.gitsigns,
					null_ls.builtins.code_actions.eslint_d,
					null_ls.builtins.code_actions.refactoring,

					-- formatting
					null_ls.builtins.formatting.black,
					null_ls.builtins.formatting.clang_format,
					null_ls.builtins.formatting.prettier.with({
						prefer_local = 'node_modules/.bin',
					}),
					null_ls.builtins.formatting.stylua.with({
						extra_args = { '--config-path', vim.fn.expand('~/dotfiles/stylua.toml') },
					}),

					-- linter
					null_ls.builtins.diagnostics.flake8.with({
						method = null_ls.methods.DIAGNOSTICS_ON_SAVE,
						extra_args = { '--max-line-length=100' },
					}),
				},
			})
		end,
	})

	---------------------------------------------------------------------------
	---------------                     O                       ---------------
	---------------------------------------------------------------------------
	-- use({
	-- 	'stevearc/oil.nvim',
	-- 	config = function()
	-- 		require('oil').setup()
	-- 	end,
	-- })
	use({
		'navarasu/onedark.nvim',
		config = function()
			require('onedark').setup({
				style = 'darker',
				transparent = false,
				ending_tildes = true,
				code_style = {
					comments = 'italic',
					keywords = 'none',
					functions = 'italic',
					strings = 'none',
					variables = 'bold',
				},
			})
			require('onedark').load()
		end,
	})

	---------------------------------------------------------------------------
	---------------                     P                       ---------------
	---------------------------------------------------------------------------
	use('normen/vim-pio')
	use({
		'jiriks74/presence.nvim',
		config = function()
			require('presence'):setup({
				-- General options
				auto_update = true,        -- Update activity based on autocmd events (if `false`, map or manually execute `:lua package.loaded.presence:update()`)
				neovim_image_text = 'Bom bom bakudan', -- Text displayed when hovered over the Neovim image
				main_image = 'file',       -- Main image display (either "neovim" or "file")
				client_id = '1172122807501594644', -- Use your own Discord application client id (not recommended)
				log_level = nil,           -- Log messages at or above this level (one of the following: "debug", "info", "warn", "error")
				debounce_timeout = 10,     -- Number of seconds to debounce events (or calls to `:lua package.loaded.presence:update(<filename>, true)`)
				enable_line_number = true, -- Displays the current line number instead of the current project
				blacklist = {},            -- A list of strings or Lua patterns that disable Rich Presence if the current file name, path, or workspace matches
				buttons = true,            -- Configure Rich Presence button(s), either a boolean to enable/disable, a static table (`{{ label = "<label>", url = "<url>" }, ...}`, or a function(buffer: string, repo_url: string|nil): table)
				file_assets = {},          -- Custom file asset definitions keyed by file names and extensions (see default config at `lua/presence/file_assets.lua` for reference)
				show_time = true,          -- Show the timer

				-- Rich Presence text options
				editing_text = 'Editing %s',  -- Format string rendered when an editable file is loaded in the buffer (either string or function(filename: string): string)
				file_explorer_text = 'Browsing %s', -- Format string rendered when browsing a file explorer (either string or function(file_explorer_name: string): string)
				git_commit_text = 'Committing changes', -- Format string rendered when committing changes in git (either string or function(filename: string): string)
				plugin_manager_text = 'Managing plugins', -- Format string rendered when managing plugins (either string or function(plugin_manager_name: string): string)
				reading_text = 'Reading %s',  -- Format string rendered when a read-only or unmodifiable file is loaded in the buffer (either string or function(filename: string): string)
				workspace_text = 'Working on %s', -- Format string rendered when in a git repository (either string or function(project_name: string|nil, filename: string): string)
				line_number_text = 'Line %s out of %s', -- Format string rendered when `enable_line_number` is set to true (either string or function(line_number: number, line_count: number): string)
			})
		end,
	})

	---------------------------------------------------------------------------
	---------------                     R                       ---------------
	---------------------------------------------------------------------------
	use('tpope/vim-rhubarb')

	---------------------------------------------------------------------------
	---------------                     R                       ---------------
	---------------------------------------------------------------------------
	use({
		'ThePrimeagen/refactoring.nvim',
		requires = {
			{ 'nvim-lua/plenary.nvim' },
			{ 'nvim-treesitter/nvim-treesitter' },
		},
	})

	---------------------------------------------------------------------------
	---------------                     S                       ---------------
	---------------------------------------------------------------------------
	use('tpope/vim-surround')
	use('tpope/vim-sleuth')
	use({
		'petertriho/nvim-scrollbar',
		config = function()
			require('scrollbar').setup()
		end,
	})
	use({
		'danielfalk/smart-open.nvim',
		branch = '0.2.x',
		config = function()
			require('telescope').load_extension('smart_open')
		end,
		requires = {
			{ 'kkharji/sqlite.lua' },
			-- Only required if using match_algorithm fzf
			{ 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
			-- Optional.  If installed, native fzy will be used when match_algorithm is fzy
			{ 'nvim-telescope/telescope-fzy-native.nvim' },
		},
	})

	---------------------------------------------------------------------------
	---------------                     T                       ---------------
	---------------------------------------------------------------------------
	use({
		'nvim-telescope/telescope.nvim',
		requires = 'nvim-lua/plenary.nvim',
		config = function()
			local telescope = require('telescope')

			telescope.setup({
				extensions = {
					fzf = {
						fuzzy = true,
						override_generic_sorter = true,
						override_file_sorter = true,
						case_mode = 'smart_case',
					},
				},
				pickers = {
					hidden = true,
				},
			})

			telescope.load_extension('fzf')
		end,
	})
	-- use({
	-- 	'nvim-telescope/telescope-file-browser.nvim',
	-- 	requires = { 'nvim-telescope/telescope.nvim', 'nvim-lua/plenary.nvim' },
	-- })
	use({ 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' })
	use({
		'folke/todo-comments.nvim',
		requires = 'nvim-lua/plenary.nvim',
		config = function()
			require('todo-comments').setup()
		end,
	})
	use({
		'akinsho/toggleterm.nvim',
		config = function()
			require('toggleterm').setup({
				direction = 'horizontal',
				open_mapping = [[<C-t>]],
			})
		end,
	})
	use({
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate',
		config = function()
			require('nvim-treesitter.configs').setup({
				highlight = {
					enable = true,
					additional_vim_regex_highlighting = { 'org' },
				},
				indent = {
					enable = true,
				},
				-- incremental_selection = {
				-- 	enable = true,
				-- 	keymaps = {
				-- 		init_selection = '<CR>',
				-- 		scope_incremental = '<CR>',
				-- 		node_incremental = '<TAB>',
				-- 		node_decremental = '<S-TAB>',
				-- 	},
				-- },
				-- folding is set in settings.lua
			})
		end,
	})
	use({
		'nvim-treesitter/nvim-treesitter-context',
		requires = 'nvim-treesitter/nvim-treesitter',
	})
	use({
		'folke/trouble.nvim',
		requires = 'kyazdani42/nvim-web-devicons',
		config = function()
			require('trouble').setup({
				actions_keys = {
					open_split = { 's' },
					open_vsplit = { 'v' },
				},
			})
		end,
	})
	use('JoosepAlviste/nvim-ts-context-commentstring')

	---------------------------------------------------------------------------
	---------------                     W                       ---------------
	---------------------------------------------------------------------------
	use({
		'kyazdani42/nvim-web-devicons',
		config = function()
			require('nvim-web-devicons').setup()
		end,
	})
end)

return M
