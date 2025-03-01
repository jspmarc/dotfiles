local plugin_keys = require('keybinds.plugins')

return {
	enabled = require('helpers').not_vscode,
	'stevearc/aerial.nvim',
	cmd = {
		'AerialGo',
		'AerialInfo',
		'AerialNext',
		'AerialPrev',
		'AerialOpen',
		'AerialClose',
		'AerialOpenAll',
		'AerialCloseAll',
		'AerialToggle',
		'AerialNavToggle',
		'AerialNavOpen',
		'AerialNavClose',
	},
	keys = plugin_keys.aerial,
	opts = {},
	-- Optional dependencies
	dependencies = {
		'nvim-treesitter/nvim-treesitter',
		'nvim-tree/nvim-web-devicons',
	},
}
