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
"Plug 'dag/vim-fish'
Plug 'ap/vim-css-color'
Plug 'sheerun/vim-polyglot'
Plug 'jackguo380/vim-lsp-cxx-highlight'
Plug 'lervag/vimtex'

" Notes and Agenda
Plug 'vimwiki/vimwiki'
"Plug 'jceb/vim-orgmode'
"Plug 'vim-scripts/utl.vim'
"Plug 'vim-scripts/SyntaxRange'

" Git integration
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'stsewd/fzf-checkout.vim'

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
Plug 'psliwka/vim-smoothie'
Plug 'wfxr/minimap.vim'

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
source $HOME/.config/nvim/plugin/theme.vim

" =============================================================================
" Plugin settings
" =============================================================================
source $HOME/.config/nvim/plugin/airline.vim
source $HOME/.config/nvim/plugin/NERDTree.vim
source $HOME/.config/nvim/plugin/NERDCommenter.vim
source $HOME/.config/nvim/plugin/mundo.vim
source $HOME/.config/nvim/plugin/IndentLine.vim
source $HOME/.config/nvim/plugin/Startify.vim
source $HOME/.config/nvim/plugin/VimWiki.vim
source $HOME/.config/nvim/plugin/Siginit.vim
source $HOME/.config/nvim/plugin/CocNvim.vim
source $HOME/.config/nvim/plugin/floaterm.vim
source $HOME/.config/nvim/plugin/vimtex.vim
source $HOME/.config/nvim/plugin/GitGutter.vim
source $HOME/.config/nvim/plugin/FZF.vim
source $HOME/.config/nvim/plugin/easymotion.vim

" -----------------------------------------------------------------------------
" Coc-nvim
" -----------------------------------------------------------------------------
" Used for <tab> completion
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" =============================================================================
" Vim settings
" =============================================================================
source $HOME/.config/nvim/settings.vim

" =============================================================================
" Custom functions
" =============================================================================
source $HOME/.config/nvim/myFuncions.vim

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
source $HOME/.config/nvim/neovide/neovide.vim

" =============================================================================
" Neovim-Qt
" =============================================================================
if exists('g:GuiLoaded')
    source $HOME/.config/nvim/Neovim-Qt/config.vim
endif

" =============================================================================
" Keybindings
" =============================================================================
source $HOME/.config/nvim/keybindings.vim

" -----------------------------------------------------------------------------
" Mundo
" -----------------------------------------------------------------------------
" Already loaded in plugins settings

" -----------------------------------------------------------------------------
" NERDCommenter
" -----------------------------------------------------------------------------
" Already loaded in plugins settings

" -----------------------------------------------------------------------------
" gitgutter
" -----------------------------------------------------------------------------
" Already loaded in plugins settings

" -----------------------------------------------------------------------------
" Fugitive
" -----------------------------------------------------------------------------
" Already loaded in plugins settings

" -----------------------------------------------------------------------------
" Coc
" -----------------------------------------------------------------------------
" Some are allready loaded in plugins settings
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
" Already loaded in plugins settings

" -----------------------------------------------------------------------------
" vim-easymotion
" -----------------------------------------------------------------------------n
" Already loaded in plugins settings

" -----------------------------------------------------------------------------
" floaterm
" -----------------------------------------------------------------------------n
" Already loaded in plugins settings

" -----------------------------------------------------------------------------
" fzf-checkout.vim
" -----------------------------------------------------------------------------n

