"         _ __  __
"        | |  \/  |    Josep Macello
"     _  | | |\/| |    https://github.com/jspmarc
"    | |_| | |  | |    https://linkedin.com/in/josepmk1
"     \___/|_|  |_|
"

" __   __   __     __    __     ______     ______
"/\ \ / /  /\ \   /\ "-./  \   /\  == \   /\  ___\
"\ \ \'/   \ \ \  \ \ \-./\ \  \ \  __<   \ \ \____
" \ \__|    \ \_\  \ \_\ \ \_\  \ \_\ \_\  \ \_____\
"  \/_/      \/_/   \/_/  \/_/   \/_/ /_/   \/_____/

" =============================================================================
" Vim plug plugins and all
" =============================================================================
call plug#begin('~/.vim/plugged')

" Completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Syntax highlighting
Plug 'chrisbra/csv.vim'
Plug 'yggdroot/indentline'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
Plug 'dag/vim-fish'
Plug 'ap/vim-css-color'
Plug 'sheerun/vim-polyglot'

" Notes and Agenda
Plug 'vimwiki/vimwiki'
"Plug 'jceb/vim-orgmode'
"Plug 'vim-scripts/utl.vim'
"Plug 'vim-scripts/SyntaxRange'

" Git integration
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Undo things
Plug 'simnalamburt/vim-mundo'

" Motion
Plug 'easymotion/vim-easymotion'

" File explorer
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'

" Misc
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'ryanoasis/vim-devicons'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'mhinz/vim-startify'
Plug 'houtsnip/vim-emacscommandline'
Plug 'johannesthyssen/vim-signit'
Plug 'turbio/bracey.vim'
Plug 'voldikss/vim-floaterm'

" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Themes
Plug 'morhetz/gruvbox'
Plug 'tomasiser/vim-code-dark'
Plug 'kaicataldo/material.vim', { 'branch': 'main' }
"Plug 'tomasr/molokai'
"Plug 'mhartington/oceanic-next'
"Plug 'arcticicestudio/nord-vim'
"Plug 'chriskempson/base16-vim'

" Initialize plugin system
call plug#end()
" End plug vim

" =============================================================================
" theme settings
" =============================================================================
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

if (has("termguicolors"))
    set termguicolors
endif

" -----------------------------------------------------------------------------
" For gruvbox
" -----------------------------------------------------------------------------
let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_hls_cursor = 'purple'
let g:gruvbox_italic = 1
let g:gruvbox_italicize_strings =  0
let g:gruvbox_italicize_comments = 1

" -----------------------------------------------------------------------------
" Oceanic next
" -----------------------------------------------------------------------------
let g:oceanic_next_terminal_bold = 1
let g:oceanic_next_terminal_italic = 1

" -----------------------------------------------------------------------------
" for nord
" -----------------------------------------------------------------------------
let g:nord_cursor_line_number_background = 1
let g:nord_bold_vertical_split_line = 1
let g:nord_italic = 1
let g:nord_italic_comments = 1
let g:nord_underline = 1

" ----------------------------------------------------------------------------
" for material
" -----------------------------------------------------------------------------
let g:material_theme_style = 'darker'
let g:material_terminal_italics = 1

syntax on
syntax enable

colorscheme material

" =============================================================================
" Plugin settings
" =============================================================================

" -----------------------------------------------------------------------------
" Airline theme and customization
" -----------------------------------------------------------------------------
let g:airline_theme='codedark'
let g:airline_powerline_fonts = 1

let g:airline_left_sep = "\uE0B8"
let g:airline_right_sep = "\uE0BA"
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline_section_c = '%t%m%r'
let g:airline_section_z = "\uE0A1 %l/%L \uE0B3 %P"
let g:airline_section_y = ''

" -----------------------------------------------------------------------------
" NERDTree
" -----------------------------------------------------------------------------
" Automatically opens NERDTree when opening neovim and selecting a folder
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '

" -----------------------------------------------------------------------------
" Mundo
" -----------------------------------------------------------------------------
let g:mundo_width = 30

" -----------------------------------------------------------------------------
" Indent Line
" -----------------------------------------------------------------------------
"let g:indentLine_char_list = ['|', '¦', '┆', '┊']
"let g:indentLine_char = '.'
let g:indentLine_setColors = 0
let g:indentLine_color_gui = '#b8bb26'
"let g:indentLine_bgcolor_gui = '#FFFFFF'
let g:indentLine_color_term = 2
"let g:indentLine_bgcolor_term = 255

" -----------------------------------------------------------------------------
" For startify
" -----------------------------------------------------------------------------
let g:startify_session_dir = "~/.vim/sessions/"
" Read ~/.NERDTreeBookmarks file and takes its second column
function! s:nerdtreeBookmarks()
    let bookmarks = systemlist("cut -d' ' -f 2 ~/.NERDTreeBookmarks")
    let bookmarks = bookmarks[0:-2] " Slices an empty last line
    return map(bookmarks, "{'line': v:val, 'path': v:val}")
endfunction

let g:ascii = [
        \ '      ___           ___           ___           ___                       ___     ',
        \ '     /\__\         /\  \         /\  \         /\__\          ___        /\__\    ',
        \ '    /::|  |       /::\  \       /::\  \       /:/  /         /\  \      /::|  |   ',
        \ '   /:|:|  |      /:/\:\  \     /:/\:\  \     /:/  /          \:\  \    /:|:|  |   ',
        \ '  /:/|:|  |__   /::\~\:\  \   /:/  \:\  \   /:/__/  ___      /::\__\  /:/|:|__|__ ',
        \ ' /:/ |:| /\__\ /:/\:\ \:\__\ /:/__/ \:\__\  |:|  | /\__\  __/:/\/__/ /:/ |::::\__\',
        \ ' \/__|:|/:/  / \:\~\:\ \/__/ \:\  \ /:/  /  |:|  |/:/  / /\/:/  /    \/__/~~/:/  /',
        \ '     |:/:/  /   \:\ \:\__\    \:\  /:/  /   |:|__/:/  /  \::/__/           /:/  / ',
        \ '     |::/  /     \:\ \/__/     \:\/:/  /     \::::/__/    \:\__\          /:/  /  ',
        \ '     /:/  /       \:\__\        \::/  /       ~~~~         \/__/         /:/  /   ',
        \ '     \/__/         \/__/         \/__/                                   \/__/    ',
        \ ]

let g:startify_custom_header = startify#center(g:ascii)

let g:startify_lists = [
        \ { 'type': 'sessions',                      'header': ['   Sessions']},
        \ { 'type': function('s:nerdtreeBookmarks'), 'header': ['   NERDTree Bookmarks']},
        \ { 'type': 'files',                         'header': ['   Recent Files']},
        \ { 'type': 'dir',                           'header': ['   Files in dir']},
        \]

" -----------------------------------------------------------------------------
" Vim Wiki settings
" -----------------------------------------------------------------------------
let g:vimwiki_global_ext= 0
let g:vimwiki_folding = 'list'
let g:vimwiki_hl_headers = 1
let g:vimwiki_html_header_numbering = 2
let g:vimwiki_list = [{'path': '~/vimwiki-notes/', 'syntax': 'markdown', 'ext': '.md'}]
let g:vimwiki_diary_months = {
      \ 1: 'Januari', 2: 'Februari', 3: 'Maret',
      \ 4: 'April', 5: 'Mei', 6: 'Juni',
      \ 7: 'Juli', 8: 'Agustus', 9: 'September',
      \ 10: 'Oktober', 11: 'November', 12: 'Desember'
      \ }

" -----------------------------------------------------------------------------
" Siginit settingns
" -----------------------------------------------------------------------------
let g:signit_initials = 'JM'
let g:signit_name = 'Josep Macello'
let g:signit_extra_1 = 'https://github.com/jspmarc'
let g:signit_extra_2 = 'https://linkedin.com/in/josepmk1'

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

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

" Used for <tab> completion
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" provide custom statusline: lightline.vim, vim-airline." provide custom
" statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" -----------------------------------------------------------------------------
" floaterm
" -----------------------------------------------------------------------------n
let g:floaterm_gitcommit = 'vsplit'
let g:floaterm_autoclose = 1
command! LF FloatermNew lf

" =============================================================================
" Startup settings
" =============================================================================
set guicursor=c-v-r-cr:hor75
            \,i-ci:ver75
            \,n:block
            \,a:blinkon0
"let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

set autowrite " Autosave on leaving vim
set tabstop=4 softtabstop=4 shiftwidth=4
set expandtab
"set noexpandtab
set smartindent
set ignorecase smartcase
set nu rnu
set noswapfile
set nobackup
set nowritebackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set linebreak
set scrolloff=3
set sidescrolloff=5
set background=dark
"hi Normal ctermbg=NONE guibg=NONE
"set cul
set colorcolumn=80
set clipboard+=unnamedplus
set list lcs=tab:\|\ 
set updatetime=100
set mouse=nvi
set nowrap
"set nocompatible " For Vimwiki
set hidden
set shortmess+=c
set autochdir

" =============================================================================
" Custom functions
" =============================================================================
" CompileFile(): A custom function that will compile the file in question
" using a bash script
function! CompileFile()
    "cd %:p:h " Not needed since using 'set autochdir'
    execute '!compile %'
    "cd - " Not needed since using 'set autochdir'
endfunction

" RunFile(): A custom function that will run a file after it is compiled. E.g:
" Opens Zathura after compiling markdown to pdf
function! RunFile()
    " Removes the file extension
    let filename = substitute(g:filename, '\..*', '', '')
    let run = ''

    if expand('%:e') == 'md'
        let filename = filename.'.pdf'
        "let fpath = g:fpath.filename " Not needed since using 'set autochdir'
        let fpath = filename
        let run = '!zathura '.fpath
    endif
    
    execute run
endfunction

" =============================================================================
" Commands to run everytime buffer changes
" =============================================================================
augroup fname_fpath
    au!
    autocmd BufEnter * let g:filename = expand('%:t')
    "autocmd BufEnter * let g:fpath = expand('%:p:h').'/' " Not needed since using 'set autochdir'
augroup END

" =============================================================================
" Custom commands for different filetypes
" =============================================================================
"autocmd FileType python setlocal shiftwidth=2 softtabstop=2 tabstop=2
autocmd FileType php setlocal shiftwidth=2 softtabstop=2 tabstop=2
autocmd FileType typescript setlocal shiftwidth=2 softtabstop=2 tabstop=2
autocmd FileType typescriptreact setlocal shiftwidth=2 softtabstop=2 tabstop=2 syntax=typescript
autocmd FileType javascript setlocal shiftwidth=2 softtabstop=2 tabstop=2 syntax=typescript
autocmd FileType css setlocal shiftwidth=2 softtabstop=2 tabstop=2
autocmd FileType html setlocal shiftwidth=2 softtabstop=2 tabstop=2
autocmd FileType yaml setlocal shiftwidth=2 softtabstop=2 tabstop=2
""autocmd FileType vimwiki setlocal shiftwidth=2 softtabstop=2 tabstop=2 expandtab
""autocmd FileType vimwiki IndentLinesDisable
autocmd FileType markdown setlocal shiftwidth=2 softtabstop=2 tabstop=2
autocmd FileType markdown IndentLinesDisable
autocmd FileType json IndentLinesDisable
autocmd BufEnter *.notal setfiletype notal

" =============================================================================
" neovide
" =============================================================================
let g:neovide_cursor_animation_length=0.05
let g:neovide_cursor_trail_length=0
let g:neovide_cursor_antialiasing=v:false

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
nmap <C-g> '

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

" Toggle options
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
" Plugins map
" -----------------------------------------------------------------------------

" -----------------------------------------------------------------------------
" NerdTree
" -----------------------------------------------------------------------------
"nnoremap <C-b> :NERDTreeToggle<CR>
nnoremap <C-b> :NERDTreeTabsToggle<CR>

" -----------------------------------------------------------------------------
" Mundo
" -----------------------------------------------------------------------------
nnoremap <C-z> :MundoToggle<CR>

" -----------------------------------------------------------------------------
" Nerdcommenter
" -----------------------------------------------------------------------------
" <C-/> is mapped as <C-_>
nmap <C-_> <Plug>NERDCommenterToggle
vmap <C-_> <Plug>NERDCommenterToggle

" -----------------------------------------------------------------------------
" gitgutter
" -----------------------------------------------------------------------------
nnoremap <Leader>g] :GitGutterNextHunk<CR>
nnoremap <Leader>g[ :GitGutterPrevHunk<CR>
nnoremap <Leader>gp :GitGutterPreviewHunk<CR>
nnoremap <Leader>gn :GitGutterStageHunk<CR>
"nnoremap <Leader>gu :GitGutterUndoHunk<CR>

" -----------------------------------------------------------------------------
" Fugitive
" -----------------------------------------------------------------------------
nnoremap <Leader>gs :G status<CR>
nnoremap <Leader>ga :G add --patch<CR>
nnoremap <Leader>gc :G commit<CR>
nnoremap <Leader>gd :G diff<CR>

" -----------------------------------------------------------------------------
" Coc
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

" Use <tab> to select completion
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Use <CR> to choose completion
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif


" -----------------------------------------------------------------------------
" FZF-vim
" -----------------------------------------------------------------------------
" Opens fzf BLines
nmap <C-f> :BLines<CR>
nmap <C-p> :Buffers<CR>

" -----------------------------------------------------------------------------
" vim-easymotion
" -----------------------------------------------------------------------------n
nmap <leader><leader>f <Plug>(easymotion-overwin-f)
nmap <leader><leader>w <Plug>(easymotion-overwin-w)
nmap <leader><leader>e <Plug>(easymotion-e)
nmap <leader><leader>b <Plug>(easymotion-b)
nmap <leader><leader>j <Plug>(easymotion-j)
nmap <leader><leader>k <Plug>(easymotion-k)

" -----------------------------------------------------------------------------
" floaterm
" -----------------------------------------------------------------------------n

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
