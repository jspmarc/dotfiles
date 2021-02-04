local saga = require 'lspsaga'

saga.init_lsp_saga()

----- keybindings -----
map('n', 'gh', ':Lspsaga lsp_finder<CR>')
map('n', '<C-k>', ':Lspsaga signature_help<CR>')
map('n', 'K', ':Lspsaga preview_definition<CR>')
map('n', 'ca', ':Lspsaga code_action<CR>')
map('v', 'ca', ':Lspsaga range_code_action<CR>')
