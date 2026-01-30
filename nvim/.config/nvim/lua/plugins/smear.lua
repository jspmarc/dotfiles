local helpers = require('helpers')
return {
	-- only enable on linux or windows AND if not in neovide and not in vscode
	enabled = helpers.not_neovide and helpers.not_vscode,
	'sphamba/smear-cursor.nvim',
	opts = {
		stiffness = 0.5,
		trailing_stiffness = 0.5,
		matrix_pixel_threshold = 0.5,
	},
}
