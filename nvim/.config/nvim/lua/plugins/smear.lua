local helpers = require('helpers')
return {
	-- only enable on linux or windows AND if not in neovide and not in vscode
	enabled = not helpers.is_mac and helpers.not_neovide and helpers.not_vscode,
	'sphamba/smear-cursor.nvim',
	opts = {},
}
