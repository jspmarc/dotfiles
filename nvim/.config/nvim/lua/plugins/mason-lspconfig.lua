local lsp_servers = require('helpers').lsp_servers

return {
	enabled = require('helpers').not_vscode,
	'williamboman/mason-lspconfig.nvim',
	dependencies = { 'williamboman/mason.nvim', 'neovim/nvim-lspconfig' },
	opts = {
		ensure_installed = lsp_servers,
	},
}
