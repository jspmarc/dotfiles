" -----------------------------------------------------------------------------
" Coc-nvim
" -----------------------------------------------------------------------------

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" provide custom statusline: lightline.vim, vim-airline." provide custom
" statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

let g:lsp_cxx_hl_use_text_props = 1
"let g:lsp_cxx_hl_log_file = '/home/josep/.config/nvim/vim-lsp-cxx.log'
