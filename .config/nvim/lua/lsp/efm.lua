-- taken from: https://github.com/tsuyoshicho/vim-efm-langserver-settings
-- modified by github.com/jspmarc
local eslint = {
	lintCommand = "eslint -f unix --stdin --stdin-filename ${INPUT}",
	lintIgnoreExitCode = true,
	lintStdin = true,
	lintFormats = { "%f:%l:%c: %m" },
	formatCommand = "eslint --fix-to-stdout --stdin --stdin-filename=${INPUT}",
	formatStdin = true,
}
local clang_format = { formatCommand = "clang-format -style=LLVM ${INPUT}", formatStdin = true }
local prettier = { formatCommand = "prettier --stdin-filepath ${INPUT}", formatStdin = true }
local stylua = { formatCommand = "stylua -s -", formatStdin = true }
local flake8 = { formatCommand = "flake8 --quiet -", formatStdin = true }

return {
	init_options = { documentFormatting = true },
	settings = {
		languages = {
			c = { clang_format },
			cpp = { clang_format },
			css = { prettier },
			html = { prettier },
			javascript = { prettier, eslint },
			javascriptreact = { prettier, eslint },
			json = { prettier },
			lua = { stylua },
			markdown = { prettier },
			python = { flake8 },
			scss = { prettier },
			typescript = { prettier, eslint },
			typescriptreact = { prettier, eslint },
			yaml = { prettier },
		},
	},
	filetypes = { "lua", "python", "javascript", "javascriptreact", "typescript", "typescriptreact" },
}
