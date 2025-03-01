local helpers = require('helpers')

vim.g.vimsyn_embed = 'l'
vim.g['sneak#label'] = 1
vim.g.mapleader = '\\'
vim.g.maplocalleader = '\\'

---------------------------------------------------------------------------------------------------
-- Load Modules
---------------------------------------------------------------------------------------------------
require('settings')
-- Note about Lazy.nvim:
-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
require('config.lazy')
if helpers.not_vscode then
	require('lsp.settings')
end
require('keybinds')
require('autocommands')

helpers.set_colorscheme()

---------------------------------------------------------------------------------------------------
-- Custom commands for different filetypes
---------------------------------------------------------------------------------------------------
-- vim.cmd([[autocmd FileType rust setlocal expandtab]])
-- vim.cmd([[autocmd FileType python setlocal expandtab]])
-- vim.cmd([[autocmd BufWritePre * lua vim.lsp.buf.formatting(nil)]])
-- vim.cmd([[autocmd CursorHold * lua vim.diagnostic.open_float()]])
