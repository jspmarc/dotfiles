local helpers = require('helpers')
return {
	enabled = helpers.not_vscode and helpers.not_neovide,
	'sphamba/smear-cursor.nvim',
	opts = {},
}
