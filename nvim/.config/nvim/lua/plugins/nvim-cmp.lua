local cmp = require('cmp')
local cmp_autopairs = require('nvim-autopairs.completion.cmp')

local kind_icons = {
	Text = '',
	Method = '',
	Function = '',
	Constructor = '',
	Field = '',
	Variable = '',
	Class = 'ﴯ',
	Interface = '',
	Module = '',
	Property = 'ﰠ',
	Unit = '',
	Value = '',
	Enum = '',
	Keyword = '',
	Snippet = '',
	Color = '',
	File = '',
	Reference = '',
	Folder = '',
	EnumMember = '',
	Constant = '',
	Struct = '',
	Event = '',
	Operator = '',
	TypeParameter = '',
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
		{ name = 'nvim_lsp' },
		{ name = 'luasnip' },
	}, {
		{ name = 'buffer' },
	}),

	formatting = {
		format = function(entry, vim_item)
			-- Kind icons
			vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
			-- Source
			vim_item.menu = ({
				buffer = '[Buffer]',
				nvim_lsp = '[LSP]',
				luasnip = '[LuaSnip]',
				nvim_lua = '[Lua]',
				latex_symbols = '[LaTeX]',
			})[entry.source.name]
			return vim_item
		end,
	},
})

cmp.setup.cmdline('/', {
	sources = {
		{ name = 'buffer' },
	},
})

cmp.setup.cmdline(':', {
	sources = cmp.config.sources({
		{ name = 'path' },
	}, {
		{ name = 'cmdline' },
	}),
})

cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done({ map_char = { tex = '' } }))
