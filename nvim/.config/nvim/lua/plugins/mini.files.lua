local plugin_keys = require('keybinds.plugins')

return {
	enabled = require('helpers').not_vscode,
	'echasnovski/mini.files',
	branch = 'stable',
	keys = plugin_keys['mini.files'],
	opts = {},
}
