local saga = require 'lspsaga'

saga.init_lsp_saga()

----- keybindings -----
--
--nnoremap <silent> gh :Lspsaga lsp_finder<CR>
--nnoremap <silent> gs :Lspsaga signature_help<CR>
--nnoremap <silent> gd :Lspsaga preview_definition<CR>
map('n', 'gh', ':Lspsaga lsp_finder<CR>')
map('n', '<C-k>', ':Lspsaga signature_help<CR>')
map('n', 'K', ':Lspsaga preview_definition<CR>')
