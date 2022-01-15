local g = vim.g

require('onedark').setup({
	style = 'darker',
})

g.dracula_show_end_of_buffer = true

vim.cmd('colorscheme onedark')
