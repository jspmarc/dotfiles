command! -nargs=0 Prettier :CocCommand prettier.formatFile

" =============================================================================
" Keybindings
" =============================================================================
vmap <leader>fp  <Plug>(coc-format-selected)
nmap <leader>fp  <Plug>(coc-format-selected)
