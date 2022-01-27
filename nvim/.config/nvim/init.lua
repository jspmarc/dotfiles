vim.g.vimsyn_embed = 'l'

---------------------------------------------------------------------------------------------------
-- Load Modules
---------------------------------------------------------------------------------------------------
require('settings')
require('keybinds')
-- require('plugins')
require('plugins.0keybinds')
require('lsp.settings')
-- require'netrw'

vim.cmd([[colorscheme onedark]])


---------------------------------------------------------------------------------------------------
-- Custom commands for different filetypes
---------------------------------------------------------------------------------------------------
-- vim.cmd([[autocmd FileType rust setlocal expandtab]])
-- vim.cmd([[autocmd FileType python setlocal expandtab]])
-- vim.cmd([[autocmd BufWritePre * lua vim.lsp.buf.formatting_sync(nil, 1000)]])
vim.cmd([[autocmd BufEnter *.notal setfiletype notal]])
vim.cmd([[autocmd BufEnter *.asm setfiletype nasm]])
-- vim.cmd([[autocmd CursorHold * lua vim.diagnostic.open_float()]])
vim.cmd([[
augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank { higroup='IncSearch', timeout=200 }
augroup END
]])
