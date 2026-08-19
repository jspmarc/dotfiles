return {
	init_options = {
		plugins = {
			{
				name = '@vue/typescript-plugin',
				location = vim.fn.stdpath('data')
					.. '/mason/packages/vue-language-server/node_modules/@vue/language-server',
				languages = { 'javascript', 'typescript', 'vue' },
			},
		},
	},
	filetypes = {
		'javascript',
		'javascriptreact',
		'javascript.jsx',
		'typescript',
		'typescriptreact',
		'typescript.tsx',
		'vue',
	},
	settings = {
		typescript = {
			implementationsCodeLens = { enabled = true },
			referencesCodeLens = { enabled = true },
		},
		javascript = {
			implementationsCodeLens = { enabled = true },
			referencesCodeLens = { enabled = true },
		},
	},
}
