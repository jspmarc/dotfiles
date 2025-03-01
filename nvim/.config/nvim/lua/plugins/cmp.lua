return {
	enabled = require('helpers').not_vscode,
	'hrsh7th/nvim-cmp',
	event = 'InsertEnter',
	dependencies = {
		'hrsh7th/cmp-nvim-lsp',
		'hrsh7th/cmp-buffer',
		'hrsh7th/cmp-path',
		'hrsh7th/cmp-cmdline',
		'hrsh7th/cmp-nvim-lsp-document-symbol',
		'hrsh7th/cmp-nvim-lsp-signature-help',
		'saadparwaiz1/cmp_luasnip',
	},
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

		cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done({ map_char = { tex = '' } }))
	end,
}
