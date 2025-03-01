return {
	enabled = require('helpers').not_vscode,
	'NeogitOrg/neogit',
	cmd = { 'Neogit', 'NeogitCommit', 'NeogitLogCurrent', 'NeogitResetState' },
	keys = require('keybinds.plugins').neogit,
	dependencies = {
		'nvim-lua/plenary.nvim',
		'sindrets/diffview.nvim',
	},
	opts = {},
}
