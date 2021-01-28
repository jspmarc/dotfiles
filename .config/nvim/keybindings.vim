" =============================================================================
" Keybindings
" =============================================================================
" Leader is still backslash ( '\' , mapped to backspace)
"let mapleader = ','
nmap <space> <leader><leader>
map <BS> <leader>

"map <C-s> :w<CR>
"map <C-c>f :q!<CR>
"map <C-c>s :wq!<CR>

tmap <Esc><Esc> <C-\><C-n>

" Opens a bottom window and a terminal in it
nmap <Leader><C-t> <C-w>s<C-w>r:exe 'resize -10'<CR>:term<CR>G

" Makes moving with marks easier
"nmap <C-g> '

" Makes <S-y> yanks to the end of the line not the whole line
nmap <S-y> y$

" Makes exiting from insert mode, visual mode, and term mode easier
imap <C-h><C-l> <C-\><C-n>
vmap <C-h><C-l> <C-\><C-n>
tmap <C-h><C-l> <C-\><C-n>

" Moving from windowsaugroup vim
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

inoremap <A-h> <C-\><C-n><C-w>h
inoremap <A-j> <C-\><C-n><C-w>j
inoremap <A-k> <C-\><C-n><C-w>k
inoremap <A-l> <C-\><C-n><C-w>l

vnoremap <A-h> <C-\><C-n><C-w>h
vnoremap <A-j> <C-\><C-n><C-w>j
vnoremap <A-k> <C-\><C-n><C-w>k
vnoremap <A-l> <C-\><C-n><C-w>l

tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l

" Window resize
nnoremap <Leader>+ :exe "vertical resize +10"<CR>
nnoremap <Leader>_ :exe "vertical resize -10"<CR>
nnoremap <Leader>= :exe "resize +5"<CR>
nnoremap <Leader>- :exe "resize -5"<CR>

" Tab-related
nnoremap <A-e> :tabn<CR>
nnoremap <A-q> :tabp<CR>
nnoremap <A-t> :tabnew<CR>
nnoremap <A-w> :tabclose<CR>

inoremap <A-e> <C-\><C-n>:tabn<CR>
inoremap <A-q> <C-\><C-n>:tabp<CR>
inoremap <A-t> <C-\><C-n>:tabnew<CR>
inoremap <A-w> <C-\><C-n>:tabclose<CR>

vnoremap <A-e> <C-\><C-n>:tabn<CR>
vnoremap <A-q> <C-\><C-n>:tabp<CR>
vnoremap <A-t> <C-\><C-n>:tabnew<CR>
vnoremap <A-w> <C-\><C-n>:tabclose<CR>

tnoremap <A-e> <C-\><C-n>:tabn<CR>
tnoremap <A-q> <C-\><C-n>:tabp<CR>
tnoremap <A-t> <C-\><C-n>:tabnew<CR>
tnoremap <A-w> <C-\><C-n>:tabclose<CR>

" Toggle setings
map <A-s> :set hls!<CR>
map <A-z> :set wrap!<CR>

" Makes indenting and un-indent lines while on visual easier
vmap < <gv
vmap > >gv

" Saves on leaving insert mode
"imap <Esc> <Esc>:w<CR>

" Automatically compile
map <leader>c :call CompileFile()<CR>
map <leader>o :call RunFile()<CR>

" -----------------------------------------------------------------------------
" CoC
" -----------------------------------------------------------------------------
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

" -----------------------------------------------------------------------------
" CoC-Prettier
" -----------------------------------------------------------------------------
vmap <leader>fp  <Plug>(coc-format-selected)
nmap <leader>fp  <Plug>(coc-format-selected)

" -----------------------------------------------------------------------------
" easymotion
" -----------------------------------------------------------------------------
nmap <leader><leader>f <Plug>(easymotion-overwin-f)
nmap <leader><leader>w <Plug>(easymotion-overwin-w)
nmap <leader><leader>e <Plug>(easymotion-e)
nmap <leader><leader>b <Plug>(easymotion-b)
nmap <leader><leader>j <Plug>(easymotion-j)
nmap <leader><leader>k <Plug>(easymotion-k)

" -----------------------------------------------------------------------------
" floaterm
" -----------------------------------------------------------------------------
nmap <leader>tn :FloatermNew<CR>
nmap <leader>tc :FloatermKill<CR>
nmap <leader>tt :FloatermToggle<CR>
nmap <leader>tl :CocList floaterm<CR>
nmap <leader>t[ :FloatermPrev<CR>
nmap <leader>t] :FloatermNext<CR>
nmap <leader>t{ :FloatermFirst<CR>
nmap <leader>t} :FloatermLast<CR>
"nmap <C-b> :FloatermNew lf<CR>

tnoremap <leader>tn <C-\><C-n>:FloatermNew<CR>
tnoremap <leader>tc <C-\><C-n>:FloatermKill<CR>
tnoremap <leader>tt <C-\><C-n>:FloatermToggle<CR>
tnoremap <leader>tl <C-\><C-n>:CocList floaterm<CR>
tnoremap <leader>t[ <C-\><C-n>:FloatermPrev<CR>
tnoremap <leader>t] <C-\><C-n>:FloatermNext<CR>
tnoremap <leader>t{ <C-\><C-n>:FloatermFirst<CR>
tnoremap <leader>t} <C-\><C-n>:FloatermLast<CR>
"tmap <C-b> <C-\><C-n>:FloatermKill<CR>

" -----------------------------------------------------------------------------
" fugtive.vim
" -----------------------------------------------------------------------------
nnoremap <Leader>gs :G<CR>
nnoremap <Leader>ga :G add --patch<CR>
nnoremap <Leader>gh :diffget //3<CR>
nnoremap <leader>gf :diffget //2<CR>
nnoremap <Leader>gd :G diff<CR>

" -----------------------------------------------------------------------------
" fzf-checkout
" -----------------------------------------------------------------------------
nnoremap <Leader>gc :GBranch<CR>

" -----------------------------------------------------------------------------
" fzf-checkout
" -----------------------------------------------------------------------------
" Opens fzf BLines
nmap <C-f> :BLines<CR>
nmap <C-p> :Buffers<CR>

" -----------------------------------------------------------------------------
" fzf-checkout
" -----------------------------------------------------------------------------
nnoremap <Leader>g] :GitGutterNextHunk<CR>
nnoremap <Leader>g[ :GitGutterPrevHunk<CR>
nnoremap <Leader>gp :GitGutterPreviewHunk<CR>
nnoremap <Leader>gg :GitGutterStageHunk<CR>
nnoremap <Leader>gu :GitGutterUndoHunk<CR>
