return {
	enabled = require('helpers').not_vscode,
	'jayp0521/mason-null-ls.nvim',
	dependencies = { 'williamboman/mason.nvim', 'jose-elias-alvarez/null-ls.nvim' },
	opts = {
		automatic_setup = true,
		ensure_installed = vim.tbl_extend(
			'force',
			require('helpers').null_ls_formatters,
			require('helpers').null_ls_linters
		),
	},
}
