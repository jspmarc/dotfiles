return {
	enabled = require('helpers').not_vscode,
	'navarasu/onedark.nvim',
	priority = 1000,
	lazy = false,
	opts = {
		style = 'darker',
		transparent = false,
		ending_tildes = true,
		code_style = {
			comments = 'italic',
			keywords = 'none',
			functions = 'italic',
			strings = 'none',
			variables = 'bold',
		},
	},
}
