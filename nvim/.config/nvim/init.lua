local helpers = require('helpers')

---------------------------------------------------------------------------------------------------
-- Load Modules
---------------------------------------------------------------------------------------------------
require('settings')
require('config.lazy')
if helpers.not_vscode then
	require('lsp')
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
