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

" =============================================================================
" Keybindings
" =============================================================================
" Opening a new coc diagnostic window
nnoremap <leader>e :CocList diagnostics<CR>
nnoremap <leader>E :CocDiagnostics<CR>

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

