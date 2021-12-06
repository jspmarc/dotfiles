vim.g.vimsyn_embed = 'l'

---------------------------------------------------------------------------------------------------
-- Load Modules
---------------------------------------------------------------------------------------------------
require('settings')
require('keybinds')
-- require('plugins')
require('plugins.0keybinds')
require('plugins.bufferline')
require('plugins.nvim-cmp')
require('plugins.dashboard')
require('plugins.vim-floaterm')
require('plugins.lualine')
require('plugins.presence-nvim')
require('plugins.nvim-tree')
require('plugins.nvim-treesitter')
require('plugins.telescope')
require('plugins.nvim-web-devicons')
require('lsp.settings')
require('theme')
-- require'netrw'

---------------------------------------------------------------------------------------------------
-- Custom commands for different filetypes
---------------------------------------------------------------------------------------------------
vim.api.nvim_exec(
	[[
" autocmd FileType rust setlocal expandtab
" autocmd FileType python setlocal expandtab

" autocmd BufWritePre * lua vim.lsp.buf.formatting_sync(nil, 1000)

autocmd BufEnter *.notal setfiletype notal
autocmd BufEnter *.asm setfiletype nasm
]],
	false
)
