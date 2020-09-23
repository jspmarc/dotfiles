" -----------------------------------------------------------------------------
" NERDTree
" -----------------------------------------------------------------------------
" Automatically opens NERDTree when opening neovim and selecting a folder
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '

" =============================================================================
" Keybindings
" =============================================================================
"nnoremap <C-b> :NERDTreeToggle<CR>
nnoremap <C-b> :NERDTreeTabsToggle<CR>
