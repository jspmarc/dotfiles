-- taken from: https://github.com/tsuyoshicho/vim-efm-langserver-settings
-- modified by github.com/jspmarc
local clang_format = { formatCommand = 'clang-format -style=LLVM ${INPUT}', formatStdin = true }
local prettier = { formatCommand = './node_modules/.bin/prettier --stdin-filepath ${INPUT}', formatStdin = true }
local stylua = { formatCommand = 'stylua -s -', formatStdin = true }
local flake8 = { formatCommand = 'flake8 --quiet -', formatStdin = true }

return {
	init_options = { documentFormatting = true },
	settings = {
		languages = {
			c = { clang_format },
			cpp = { clang_format },
			css = { prettier },
			html = { prettier },
			javascript = { prettier },
			javascriptreact = { prettier },
			json = { prettier },
			lua = { stylua },
			markdown = { prettier },
			python = { flake8 },
			scss = { prettier },
			typescript = { prettier },
			typescriptreact = { prettier },
			vue = { prettier },
			yaml = { prettier },
		},
	},
}
