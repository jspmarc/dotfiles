return {
	enabled = require('helpers').not_vscode,
	'lewis6991/gitsigns.nvim',
	event = { 'BufReadPost' },
	keys = require('keybinds.plugins').gitsigns,
	dependencies = {
		'nvim-lua/plenary.nvim',
	},
	opts = {
		current_line_blame = true,
		current_line_blame_opts = {
			delay = 250,
		},
	},
}
