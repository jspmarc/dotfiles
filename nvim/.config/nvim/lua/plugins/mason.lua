local lsp_servers = require('helpers').lsp_servers

return {
	{
		enabled = require('helpers').not_vscode,
		'williamboman/mason.nvim',
		opts = {},
	},
	{

		enabled = require('helpers').not_vscode,
		'williamboman/mason-lspconfig.nvim',
		dependencies = { 'williamboman/mason.nvim', 'neovim/nvim-lspconfig' },
		opts = {
			ensure_installed = lsp_servers,
		},
	},
	{
		enabled = require('helpers').not_vscode,
		'jayp0521/mason-null-ls.nvim',
		dependencies = { 'williamboman/mason.nvim', 'nvimtools/none-ls.nvim' },
		opts = {
			automatic_setup = true,
			ensure_installed = vim.tbl_extend(
				'force',
				require('helpers').null_ls_formatters,
				require('helpers').null_ls_linters
			),
		},
	},
}
