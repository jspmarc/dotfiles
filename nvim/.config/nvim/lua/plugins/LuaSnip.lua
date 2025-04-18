return {
	enabled = require('helpers').not_vscode,
	'L3MON4D3/LuaSnip',
	version = 'v2.*',
	event = 'VeryLazy',
	build = 'make install_jsregexp',
	dependencies = { 'rafamadriz/friendly-snippets' },
	config = function()
		require('luasnip.loaders.from_vscode').lazy_load()
	end,
}
