vim.g.vimsyn_embed = 'l'

---------------------------------------------------------------------------------------------------
-- Load Modules
---------------------------------------------------------------------------------------------------
require('settings')
require('keybinds')
-- require('plugins')
require('plugins.0keybinds')
require('plugins.autopairs')
require('plugins.bufferline')
require('plugins.nvim-cmp')
require('plugins.dashboard')
require('plugins.vim-floaterm')
require('plugins.indent-blankline-nvim')
require('plugins.lualine')
require('plugins.presence-nvim')
require('plugins.pretty-fold-nvim')
require('plugins.telescope')
require('plugins.todo-comments-nvim')
require('plugins.nvim-tree')
require('plugins.nvim-scrollbar')
require('plugins.trouble-nvim')
require('plugins.nvim-treesitter')
require('plugins.nvim-web-devicons')
require('lsp.settings')
require('theme')
-- require'netrw'

---------------------------------------------------------------------------------------------------
-- Custom commands for different filetypes
---------------------------------------------------------------------------------------------------
-- vim.cmd([[autocmd FileType rust setlocal expandtab]])
-- vim.cmd([[autocmd FileType python setlocal expandtab]])
-- vim.cmd([[autocmd BufWritePre * lua vim.lsp.buf.formatting_sync(nil, 1000)]])
vim.cmd([[autocmd BufEnter *.notal setfiletype notal]])
vim.cmd([[autocmd BufEnter *.asm setfiletype nasm]])
vim.cmd([[autocmd CursorHold * lua vim.diagnostic.open_float()]])
vim.cmd([[
augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank { higroup='IncSearch', timeout=200 }
augroup END
]])
