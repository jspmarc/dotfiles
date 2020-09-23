" =============================================================================
" Vim settings
" =============================================================================
set guicursor=c-v-r-cr:hor75
            \,i-ci:ver75
            \,n:block
            \,a:blinkon0
"let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1 " DEPRECATED

set autowrite " Autosave on leaving vim
set tabstop=4 softtabstop=4 shiftwidth=4 " Use spacing of 4 for indent
set expandtab " Use space as tab
"set noexpandtab
set smartindent " Automatically indents
set ignorecase smartcase " Ignore case when searching, start case-sensitive when a capitilized char is found
set nu rnu " Line numbering and relative line numbering
set noswapfile " No vim swap file
set nobackup " No backup
set nowritebackup " No backup
set undodir=~/.vim/undodir " Sets the file for undo tree
set undofile " Undo tree
set incsearch " Searching stuff
set linebreak " TODO: WHat is this?
set scrolloff=3 " Same as sidescrolloff but for horizontal
set sidescrolloff=5 " Start vertical scrolling when N-5 where N is the max col length
set background=dark " Dark knight a en je a ye
"hi Normal ctermbg=NONE guibg=NONE
"set cul
set colorcolumn=80 " This is the vertical line you're seeing
set clipboard+=unnamedplus " Sets the clipboard to unnamedplus, the system's clipboard
set list lcs=tab:\|\  " Shows indent line when using tab
set updatetime=1000 " TODO: WHat is this?0
set mouse=nvi " Enabling mouse for normal, visual, and insert mode
set nowrap " Wrapping bad
"set nocompatible " For Vimwiki
set hidden " TODO: WHat is this?
set shortmess+=c " TODO: WHat is this?
set autochdir " Changing dir when switching window/buffer

