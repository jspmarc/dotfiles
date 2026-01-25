local helpers = require('helpers')
local lsp_servers = helpers.mason_lsp

return {
	{
		enabled = helpers.not_vscode,
		'williamboman/mason.nvim',
		opts = {},
	},
	{

		enabled = helpers.not_vscode,
		'williamboman/mason-lspconfig.nvim',
		dependencies = { 'williamboman/mason.nvim', 'neovim/nvim-lspconfig' },
		opts = {
			ensure_installed = lsp_servers,
		},
	},
	{
		enabled = helpers.not_vscode,
		'jayp0521/mason-null-ls.nvim',
		dependencies = { 'williamboman/mason.nvim', 'nvimtools/none-ls.nvim' },
		opts = {
			automatic_setup = true,
			ensure_installed = vim.tbl_extend(
				'force',
				helpers.null_ls_formatters,
				helpers.null_ls_linters
			),
		},
	},
	{
		enabled = helpers.not_vscode,
		'jayp0521/mason-nvim-dap.nvim',
		dependencies = { 'williamboman/mason.nvim', 'mfussenegger/nvim-dap' },
		opts = {
			automatic_setup = true,
			ensure_installed = helpers.nvim_dap_servers,
			handlers = {
				function (config)
					require('mason-nvim-dap').default_setup(config)
				end
			}
		},
	},
}
