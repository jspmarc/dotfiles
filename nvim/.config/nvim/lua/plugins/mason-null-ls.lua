return {
	'jayp0521/mason-null-ls.nvim',
	dependencies = { 'williamboman/mason.nvim' },
	config = function()
		-- local helper = require('helpers')
		-- local things = vim.tbl_extend('error', helper.null_ls_formatters, helper.null_ls_linters)
		require('mason-null-ls').setup({
			automatic_setup = true,
			ensure_installed = vim.tbl_extend(
				'force',
				require('helpers').null_ls_formatters,
				require('helpers').null_ls_linters
			),
		})
	end,
}
