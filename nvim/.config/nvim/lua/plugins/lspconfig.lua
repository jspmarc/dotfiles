return {
	enabled = require('helpers').not_vscode,
	'neovim/nvim-lspconfig',
	keys = require('keybinds.lsp'),
	event = { 'BufReadPost', 'BufNewFile' },
	cmd = { 'LspInfo', 'LspInstall', 'LspUninstall' },
}
