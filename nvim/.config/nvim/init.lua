vim.g.vimsyn_embed = 'l'
vim.g['sneak#label'] = 1

---------------------------------------------------------------------------------------------------
-- Load Modules
---------------------------------------------------------------------------------------------------
require('settings')
require('keybinds')
-- Note about Lazy.nvim:
-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
require('config.lazy')
require('lsp.settings')
require('autocommands')

require('helpers').set_colorscheme()

---------------------------------------------------------------------------------------------------
-- Custom commands for different filetypes
---------------------------------------------------------------------------------------------------
-- vim.cmd([[autocmd FileType rust setlocal expandtab]])
-- vim.cmd([[autocmd FileType python setlocal expandtab]])
-- vim.cmd([[autocmd BufWritePre * lua vim.lsp.buf.formatting(nil)]])
-- vim.cmd([[autocmd CursorHold * lua vim.diagnostic.open_float()]])
