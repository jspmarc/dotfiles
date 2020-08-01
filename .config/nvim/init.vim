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

Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'simnalamburt/vim-mundo'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'ryanoasis/vim-devicons'
Plug 'ap/vim-css-color'
Plug 'chrisbra/csv.vim'
Plug 'yggdroot/indentline'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
Plug 'turbio/bracey.vim'
Plug 'mhinz/vim-startify'
Plug 'houtsnip/vim-emacscommandline'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'dag/vim-fish'
"Plug 'vimwiki/vimwiki'

Plug 'johannesthyssen/vim-signit'

"Plug 'jceb/vim-orgmode'
"Plug 'vim-scripts/utl.vim'
"Plug 'vim-scripts/SyntaxRange'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'morhetz/gruvbox'
Plug 'tomasiser/vim-code-dark'
Plug 'kaicataldo/material.vim'
"Plug 'tomasr/molokai'
"Plug 'mhartington/oceanic-next'
"Plug 'arcticicestudio/nord-vim'
"Plug 'chriskempson/base16-vim'

" Initialize plugin system
call plug#end()
" End plug vim

let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" =============================================================================
" theme settings
" =============================================================================

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
"let g:vimwiki_folding = 'list'
"let g:vimwiki_hl_headers = 1
"let g:vimwiki_html_header_numbering = 2
"let g:vimwiki_diary_months = {
      "\ 1: 'Januari', 2: 'Februari', 3: 'Maret',
      "\ 4: 'April', 5: 'Mei', 6: 'Juni',
      "\ 7: 'Juli', 8: 'Agustus', 9: 'September',
      "\ 10: 'Oktober', 11: 'November', 12: 'Desember'
      "\ }

" -----------------------------------------------------------------------------
" Siginit settingns
" -----------------------------------------------------------------------------
let g:signit_initials = 'JM'
let g:signit_name = 'Josep Macello'
let g:signit_extra_1 = 'https://github.com/jspmarc'
let g:signit_extra_2 = 'https://linkedin.com/in/josepmk1'

" =============================================================================
" Startup settings
" =============================================================================
set guicursor=c-v-r-cr:hor75
            \,i-ci:ver75
            \,n:block
            \,a:blinkon0
"let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

set tabstop=4 softtabstop=4 shiftwidth=4
set expandtab
"set noexpandtab
set smartindent
set ignorecase smartcase
set nu rnu
set noswapfile
set nobackup
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
"set nocompatible " For Vimwiki


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
"autocmd FileType markdown setlocal shiftwidth=2 softtabstop=2 tabstop=2
autocmd FileType markdown IndentLinesDisable
autocmd FileType json IndentLinesDisable

" =============================================================================
" Keybindings
" =============================================================================
" Leader is still backslash ( "\" , remapped to space)
"let mapleader = ","
nmap <space> <Leader>
map <BS> <Leader>

"map <C-s> :w<CR>
"map <C-c>f :q!<CR>
"map <C-c>s :wq!<CR>

tmap <Esc><Esc> <C-\><C-n>

" Opens a bottom window and a terminal in it
nmap <Leader><C-t> <C-w>s<C-w>r:exe "resize -10"<CR>:term<CR>G

" Makes moving with marks easier
nmap <C-g> '

" Makes <S-y> yanks to the end of the line not the whole line
nmap <S-y> y$

" Makes exiting from insert mode, visual mode, and term mode easier
imap <C-j><C-k> <C-\><C-n>
vmap <C-j><C-k> <C-\><C-n>
tmap <C-j><C-k> <C-\><C-n>

" Moving from windows
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
nnoremap <Leader>+ :exe "vertical resize +5"<CR>
nnoremap <Leader>_ :exe "vertical resize -5"<CR>
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

" Option-related
map <A-s> :set hls!<CR>
map <A-z> :set wrap!<CR>

" -----------------------------------------------------------------------------
" Plugins map
" -----------------------------------------------------------------------------

" -----------------------------------------------------------------------------
" NerdTree toggle
" -----------------------------------------------------------------------------
"nnoremap <C-b> :NERDTreeToggle<CR>
nnoremap <C-b> :NERDTreeTabsToggle<CR>

" -----------------------------------------------------------------------------
" Mundo
" -----------------------------------------------------------------------------
nnoremap <C-z> :MundoToggle<CR>

" -----------------------------------------------------------------------------
" Nerdcommenter toggle comment
" -----------------------------------------------------------------------------
" <C-/> is mapped as <C-_>
nmap <C-_> <Plug>NERDCommenterToggle
vmap <C-_> <Plug>NERDCommenterToggle

" -----------------------------------------------------------------------------
" gitgutter
" -----------------------------------------------------------------------------
nnoremap <C-g>[ :GitGutterNextHunk<CR>
nnoremap <C-g>] :GitGutterPrevHunk<CR>
nnoremap <Leader>gp :GitGutterPreviewHunk<CR>
nnoremap <Leader>gn :GitGutterStageHunk<CR>
"nnoremap <Leader>gu :GitGutterUndoHunk<CR>

" -----------------------------------------------------------------------------
" Fugitive
" -----------------------------------------------------------------------------
nnoremap <Leader>gs :G status<CR>
nnoremap <Leader>ga :G add --patch<CR>
nnoremap <Leader>gc :G commit -m "
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

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" -----------------------------------------------------------------------------
" FZF-vim
" -----------------------------------------------------------------------------
" Opens fzf BLines
nmap <C-f> :BLines<CR>
