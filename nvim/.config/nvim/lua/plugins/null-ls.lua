return {
	enabled = require('helpers').not_vscode,
	'nvimtools/none-ls.nvim',
	config = function()
		local null_ls = require('null-ls')
		null_ls.setup({
			sources = {
				-- code actions
				null_ls.builtins.code_actions.gitsigns,
				null_ls.builtins.code_actions.eslint_d,
				null_ls.builtins.code_actions.refactoring,

				-- formatting
				null_ls.builtins.formatting.black,
				null_ls.builtins.formatting.clang_format,
				null_ls.builtins.formatting.prettier.with({
					prefer_local = 'node_modules/.bin',
				}),
				null_ls.builtins.formatting.stylua.with({
					extra_args = { '--config-path', vim.fn.expand('~/dotfiles/stylua.toml') },
				}),

				-- linter
				null_ls.builtins.diagnostics.flake8.with({
					method = null_ls.methods.DIAGNOSTICS_ON_SAVE,
					extra_args = { '--max-line-length=100' },
				}),
			},
		})
	end,
}
