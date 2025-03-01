return {
	enabled = require('helpers').not_vscode,
	'tpope/vim-fugitive',
	cmd = { 'G' },
	keys = {
		{ '<leader>gB', '<cmd>G blame<CR>', desc = 'Open fugitive blame panel' },
	},
}
