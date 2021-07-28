local saga = require 'lspsaga'
local map = require'helpers'.map

saga.init_lsp_saga()

----- keybindings -----
-- map('n', 'gh', ':Lspsaga lsp_finder<CR>')
map('n', '<C-k>', ':Lspsaga show_cursor_diagnostics<CR>')
map('n', 'gh', ':Lspsaga signature_help<CR>')
map('n', 'K', ':Lspsaga hover_doc<CR>')
map('n', '<leader>r', ':Lspsaga rename<CR>')
map('n', 'ca', ':Lspsaga code_action<CR>')
map('v', 'ca', ':Lspsaga range_code_action<CR>')
