local plugin_keys = require('keybinds.plugins')

return {
	enabled = require('helpers').not_vscode,
	'folke/trouble.nvim',
	dependencies = { 'kyazdani42/nvim-web-devicons' },
	cmd = { 'Trouble' },
	keys = vim.list_extend(plugin_keys.trouble, plugin_keys.trouble_lsp),
	opts = {
		actions_keys = {
			open_split = { 's' },
			open_vsplit = { 'v' },
		},
	},
}
