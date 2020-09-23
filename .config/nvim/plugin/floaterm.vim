" -----------------------------------------------------------------------------
" floaterm
" -----------------------------------------------------------------------------n
let g:floaterm_gitcommit = 'vsplit'
let g:floaterm_autoclose = 1
command! LF FloatermNew lf

" =============================================================================
" Keybindings
" =============================================================================
nmap <leader>tn :FloatermNew<CR>
nmap <leader>tc :FloatermKill<CR>
nmap <leader>tt :FloatermToggle<CR>
nmap <leader>tl :CocList floaterm<CR>
nmap <leader>t[ :FloatermPrev<CR>
nmap <leader>t] :FloatermNext<CR>
nmap <leader>t{ :FloatermFirst<CR>
nmap <leader>t} :FloatermLast<CR>
"nmap <C-b> :FloatermNew lf<CR>

tmap <leader>tn <C-\><C-n>:FloatermNew<CR>
tmap <leader>tc <C-\><C-n>:FloatermKill<CR>
tmap <leader>tt <C-\><C-n>:FloatermToggle<CR>
tmap <leader>tl <C-\><C-n>:CocList floaterm<CR>
tmap <leader>t[ <C-\><C-n>:FloatermPrev<CR>
tmap <leader>t] <C-\><C-n>:FloatermNext<CR>
tmap <leader>t{ <C-\><C-n>:FloatermFirst<CR>
tmap <leader>t} <C-\><C-n>:FloatermLast<CR>
"tmap <C-b> <C-\><C-n>:FloatermKill<CR>
