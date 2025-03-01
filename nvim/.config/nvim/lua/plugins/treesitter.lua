return {
	enabled = require('helpers').not_vscode,
	'nvim-treesitter/nvim-treesitter',
	build = ':TSUpdate',
	main = 'nvim-treesitter.configs',
	opts = {
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
	},
}
