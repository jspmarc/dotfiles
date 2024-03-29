vim.g.vimsyn_embed = 'l'

---------------------------------------------------------------------------------------------------
-- Load Modules
---------------------------------------------------------------------------------------------------
require('settings')
require('keybinds')
require('plugins.0keybinds')
require('lsp.settings')
require('autocommands')

vim.cmd([[colorscheme onedark]])

---------------------------------------------------------------------------------------------------
-- Custom commands for different filetypes
---------------------------------------------------------------------------------------------------
-- vim.cmd([[autocmd FileType rust setlocal expandtab]])
-- vim.cmd([[autocmd FileType python setlocal expandtab]])
-- vim.cmd([[autocmd BufWritePre * lua vim.lsp.buf.formatting(nil)]])
-- vim.cmd([[autocmd CursorHold * lua vim.diagnostic.open_float()]])
