return {
	enabled = require('helpers').not_vscode,
	'karb94/neoscroll.nvim',
	event = { 'BufEnter' },
	opts = {
		mappings = { '<C-u>', '<C-d>', '<C-u>', 'zz', 'zb', 'zt' },
	},
}
