local map = require'helpers'.map
----- options -----
-- provide custom statusline for lightline.vim and vim-airline
set_opts('w', 'statusline', [[%{coc#status()}%{get(b:, 'coc_current_function', '')}]])

----- others -----
-- Highlight the symbol and its references when holding the cursor.
--vim.api.nvim_command([[autocmd CursorHold * silent call CocActionAsync('highlight')]])
vim.api.nvim_command([[autocmd CursorHold <buffer> call CocActionAsync('highlight')]])
-- prettier
vim.api.nvim_command([[command! -nargs=0 Prettier :CocCommand prettier.formatFile]])

----- keybindings -----
map('n', '<leader>E', ':CocList diagnostics<CR>')
map('n', '<leader>e', ':CocDiagnostics<CR>')

map('n', 'gd', '<Plug>(coc-definition)', {noremap = false})
map('n', 'gy', '<Plug>(coc-type-definition)', {noremap = false})
map('n', 'gi', '<Plug>(coc-implementation)', {noremap = false})
map('n', 'gr', '<Plug>(coc-references)', {noremap = false})

map('i', '<C-space>', 'coc#refresh()', {expr = true})

map('n', 'K', ':call <SID>show_documentation()<CR>')

-- CoC-Prettier
map('v', '<leader>fp', '<Plug>(coc-format-selected)')
