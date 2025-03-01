local plugin_keys = require('keybinds.plugins')

return {
	enabled = require('helpers').not_vscode,
	'folke/trouble.nvim',
	dependencies = { 'kyazdani42/nvim-web-devicons' },
	cmd = { 'Trouble' },
	keys = plugin_keys.trouble,
	opts = {
		actions_keys = {
			open_split = { 's' },
			open_vsplit = { 'v' },
		},
	},
}
