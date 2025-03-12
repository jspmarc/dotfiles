local helpers = require('helpers')
vim.g.lumen_light_colorscheme = helpers.themes.light
vim.g.lumen_dark_colorscheme = helpers.themes.dark

return {
	enabled = require('helpers').not_vscode,
	'vimpostor/vim-lumen',
}
