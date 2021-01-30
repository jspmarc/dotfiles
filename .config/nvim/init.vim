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

" CoC
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Nvim LSP
"Plug 'neovim/nvim-lspconfig'
"Plug 'nvim-lua/completion-nvim'

" Tree-sitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Syntax highlighting
Plug 'chrisbra/csv.vim'
Plug 'yggdroot/indentline'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
"Plug 'dag/vim-fish'
Plug 'ap/vim-css-color'
Plug 'sheerun/vim-polyglot'
Plug 'lervag/vimtex'

" Git integration
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'stsewd/fzf-checkout.vim'

" Undo things
Plug 'simnalamburt/vim-mundo'

" Motion
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-surround'

" File explorer
Plug 'scrooloose/nerdtree'

" Misc
Plug 'scrooloose/nerdcommenter'
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

" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Themes
Plug 'morhetz/gruvbox'
Plug 'tomasiser/vim-code-dark'
Plug 'kaicataldo/material.vim', { 'branch': 'main' }
Plug 'jsit/toast.vim'
"Plug 'tomasr/molokai'
"Plug 'mhartington/oceanic-next'
"Plug 'arcticicestudio/nord-vim'
"Plug 'chriskempson/base16-vim'

" Initialize plugin system
call plug#end()
" End plug vim

let config_dir = stdpath('config')

" =============================================================================
" theme settings
" =============================================================================
"source $HOME/.config/nvim/plugin-settings/colorscheme.vim
execute 'source ' . config_dir . '/plugin-settings/colorscheme.vim'

" =============================================================================
" Plugin settings
" =============================================================================
"source $HOME/.config/nvim/plugin-settings/airline.vim
"source $HOME/.config/nvim/plugin-settings/NERDTree.vim
"source $HOME/.config/nvim/plugin-settings/NERDCommenter.vim
"source $HOME/.config/nvim/plugin-settings/mundo.vim
"source $HOME/.config/nvim/plugin-settings/IndentLine.vim
"source $HOME/.config/nvim/plugin-settings/Startify.vim
"source $HOME/.config/nvim/plugin-settings/CocNvim.vim
"source $HOME/.config/nvim/plugin-settings/CocPrettier.vim
"source $HOME/.config/nvim/plugin-settings/floaterm.vim
"source $HOME/.config/nvim/plugin-settings/vimtex.vim
"source $HOME/.config/nvim/plugin-settings/FZF.vim
"source $HOME/.config/nvim/plugin-settings/bracey.vim
""source $HOME/.config/nvim/plugin-settings/VimWiki.vim
""source $HOME/.config/nvim/plugin-settings/Siginit.vim

execute 'source ' . config_dir . '/plugin-settings/airline.vim'
execute 'source ' . config_dir . '/plugin-settings/NERDTree.vim'
execute 'source ' . config_dir . '/plugin-settings/NERDCommenter.vim'
execute 'source ' . config_dir . '/plugin-settings/mundo.vim'
execute 'source ' . config_dir . '/plugin-settings/IndentLine.vim'
execute 'source ' . config_dir . '/plugin-settings/Startify.vim'
execute 'source ' . config_dir . '/plugin-settings/CocNvim.vim'
execute 'source ' . config_dir . '/plugin-settings/CocPrettier.vim'
execute 'source ' . config_dir . '/plugin-settings/floaterm.vim'
execute 'source ' . config_dir . '/plugin-settings/vimtex.vim'
execute 'source ' . config_dir . '/plugin-settings/FZF.vim'
execute 'source ' . config_dir . '/plugin-settings/bracey.vim'

" -----------------------------------------------------------------------------
" Coc
" -----------------------------------------------------------------------------
" Used for <tab> completion
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <tab> to select completion
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

inoremap <silent><expr> <C-j>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><C-k> pumvisible() ? "\<C-p>" : "\<C-h>"

"" Use <CR> to choose completion
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" -----------------------------------------------------------------------------
" Nvim LSP
" -----------------------------------------------------------------------------
"lua require'lspconfig'.vimls.setup{on_attach=require'completion'.on_attach}
"lua require'lspconfig'.texlab.setup{on_attach=require'completion'.on_attach}
"lua require'lspconfig'.tsserver.setup{on_attach=require'completion'.on_attach}

" -----------------------------------------------------------------------------
" Nvim Completion
" -----------------------------------------------------------------------------
"set completeopt=menuone,noinsert,noselect
"let g:completion_matching_list = ['exact', 'substring', 'fuzzy']

" -----------------------------------------------------------------------------
" Nvim Tree-Sitter
" -----------------------------------------------------------------------------
lua <<EOF
require'nvim-treesitter.configs'.setup {
    highlight = {
        enable = true,
        custom_captures = {
          -- Highlight the @foo.bar capture group with the "Identifier" highlight group.
          ["foo.bar"] = "Identifier",
        },
    },
    indent = {
        enable = true,
    }
}
EOF

" =============================================================================
" Vim settings
" =============================================================================
"source $HOME/.config/nvim/settings.vim
"execute 'source ' . config_dir . '/settings.vim'
lua require'settings'

" =============================================================================
" Custom functions
" =============================================================================
"source $HOME/.config/nvim/myFuncions.vim
execute 'source ' . config_dir . '/myFuncions.vim'

" =============================================================================
" Commands to run everytime buffer changes
" =============================================================================
"augroup fname_fpath
    "au!
    "autocmd BufEnter * let g:filename = expand('%:t')
    ""autocmd BufEnter * let g:fpath = expand('%:p:h').'/' " Not needed since using 'set autochdir'
"augroup END

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
autocmd FileType vue setlocal shiftwidth=2 softtabstop=2 tabstop=2
autocmd FileType tex setlocal shiftwidth=2 softtabstop=2 tabstop=2
autocmd FileType tex IndentLinesDisable
"autocmd FileType vimwiki setlocal shiftwidth=2 softtabstop=2 tabstop=2 expandtab
"autocmd FileType vimwiki IndentLinesDisable
"autocmd FileType markdown setlocal shiftwidth=2 softtabstop=2 tabstop=2
autocmd FileType markdown IndentLinesDisable
autocmd FileType json IndentLinesDisable
autocmd BufEnter *.notal setfiletype notal

" =============================================================================
" Keybindings
" =============================================================================
"source $HOME/.config/nvim/keybindings.vim
execute 'source ' . config_dir . '/keybindings.vim'
" Plugins with custom keybindings:
" Mundo
" NERDCommenter
" gigutter
" Fugitive
" FZF-vim
" vim-easymotion
" floaterm
" fzf-checkout.vim
" Coc
