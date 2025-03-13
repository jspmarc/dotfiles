local helpers = require('helpers')

vim.g.vimsyn_embed = 'l'
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

---------------------------------------------------------------------------------------------------
-- Load Modules
---------------------------------------------------------------------------------------------------
require('settings')
require('config.lazy')
if helpers.not_vscode then
	require('lsp.settings')
	require('autocommands')
end
require('keybinds')

---------------------------------------------------------------------------------------------------
-- Custom commands for different filetypes
---------------------------------------------------------------------------------------------------
-- vim.cmd([[autocmd FileType rust setlocal expandtab]])
-- vim.cmd([[autocmd FileType python setlocal expandtab]])
-- vim.cmd([[autocmd BufWritePre * lua vim.lsp.buf.formatting(nil)]])
-- vim.cmd([[autocmd CursorHold * lua vim.diagnostic.open_float()]])
