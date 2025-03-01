return {
	enabled = require('helpers').not_vscode,
	'tpope/vim-sleuth',
	event = { 'BufReadPost', 'BufNewFile' },
}
