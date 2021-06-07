" __   __   __     __    __     ______     ______
"/\ \ / /  /\ \   /\ "-./  \   /\  == \   /\  ___\
"\ \ \'/   \ \ \  \ \ \-./\ \  \ \  __<   \ \ \____
" \ \__|    \ \_\  \ \_\ \ \_\  \ \_\ \_\  \ \_____\
"  \/_/      \/_/   \/_/  \/_/   \/_/ /_/   \/_____/

" =============================================================================
" Vim plug plugins and all
" =============================================================================
call plug#begin('~/.vim/plugged')

Plug 'turbio/bracey.vim' " local 'deployment' for HTML file
Plug 'mattn/calendar-vim'
Plug 'glepnir/dashboard-nvim' " pretty start menu
Plug 'mattn/emmet-vim'
" Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " enables FZF in Vim
" Plug 'junegunn/fzf.vim' " select stuff using FZF
" Plug 'stsewd/fzf-checkout.vim' " Select git branch using FZF
Plug 'b3nj5m1n/kommentary' " tpope's commentary but in lua
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  } " Preview GH style markdown
Plug 'sbdchd/neoformat' " Formatter
Plug 'scrooloose/nerdtree' " File explorer
Plug 'chr4/nginx.vim'
Plug 'romgrk/nvim-treesitter-context' " Always show context
" Plug 'kyazdani42/nvim-tree.lua' " File explorer
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} " Nvim treesitter
Plug 'kyazdani42/nvim-web-devicons'
Plug 'lukas-reineke/indent-blankline.nvim', {'branch': 'lua'} " Show spaces indent lines
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'easymotion/vim-easymotion' " jump jump
Plug 'voldikss/vim-floaterm' " floating terminal
Plug 'tpope/vim-fugitive' " show git status in statusline and other git integration
Plug 'airblade/vim-gitgutter' " Manage changes in hunks
Plug 'simnalamburt/vim-mundo' " browse past saves
Plug 'tpope/vim-surround' " modify things inside brackets and quotations faster
Plug 'houtsnip/vim-emacscommandline' " emacs key binding for the command line
Plug 'psliwka/vim-smoothie' " smooth scroll
Plug 'puremourning/vimspector' " debugger
Plug 'lervag/vimtex' " vim syntax highlighting for tex
Plug 'hrsh7th/vim-vsnip'
Plug 'vimwiki/vimwiki'

" NVIM Lsp
Plug 'hrsh7th/nvim-compe' " completion for LSP
Plug 'glepnir/lspsaga.nvim' " cool features for nvim lsp
Plug 'neovim/nvim-lspconfig' " The Nvim LSP
Plug 'ray-x/lsp_signature.nvim'
Plug 'folke/lsp-trouble.nvim'

Plug 'vim-airline/vim-airline' " pretty status line
Plug 'vim-airline/vim-airline-themes' " pretty status line, now prettier
Plug 'morhetz/gruvbox' " gruvbox color scheme
Plug 'tomasiser/vim-code-dark'

" Initialize plugin system
call plug#end()
" End plug vim

lua require'helpers'
lua require'theme'
lua require'settings'
lua require'keybinds'
lua require'plugins'
"lua require'netrw'

let config_dir = stdpath('config')
"execute 'source ' . config_dir . '/plugin-settings/Startify.vim'
execute 'source ' . config_dir . '/plugin-settings/VimWiki.vim'
execute 'source ' . config_dir . '/myFuncions.vim'

let g:wiki_root = '~/vimwiki-notes'

" =============================================================================
" CoC
" =============================================================================
"" Used for <tab> completion
"function! s:check_back_space() abort
  "let col = col('.') - 1
  "return !col || getline('.')[col - 1]  =~# '\s'
"endfunction

"" Use <tab> to select completion
"inoremap <silent><expr> <TAB>
      "\ pumvisible() ? "\<C-n>" :
      "\ <SID>check_back_space() ? "\<TAB>" :
      "\ coc#refresh()
"inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

"inoremap <silent><expr> <C-j>
      "\ pumvisible() ? "\<C-n>" :
      "\ <SID>check_back_space() ? "\<TAB>" :
      "\ coc#refresh()
"inoremap <expr><C-k> pumvisible() ? "\<C-p>" : "\<C-h>"

"" Use <CR> to choose completion
"if exists('*complete_info')
  "inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
"else
  "inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
"endif

"function! s:show_documentation()
  "if (index(['vim','help'], &filetype) >= 0)
    "execute 'h '.expand('<cword>')
  "else
    "call CocAction('doHover')
  "endif
"endfunction

" =============================================================================
" Custom commands for different filetypes
" =============================================================================
autocmd FileType php setlocal shiftwidth=2 softtabstop=2 tabstop=2
autocmd FileType typescript setlocal shiftwidth=2 softtabstop=2 tabstop=2
autocmd FileType typescriptreact setlocal shiftwidth=2 softtabstop=2 tabstop=2 syntax=typescript
autocmd FileType javascript setlocal shiftwidth=2 softtabstop=2 tabstop=2
autocmd FileType svelte setlocal shiftwidth=2 softtabstop=2 tabstop=2
autocmd FileType css setlocal shiftwidth=2 softtabstop=2 tabstop=2
autocmd FileType html setlocal shiftwidth=2 softtabstop=2 tabstop=2
autocmd FileType yaml setlocal shiftwidth=2 softtabstop=2 tabstop=2
autocmd FileType vue setlocal shiftwidth=2 softtabstop=2 tabstop=2
autocmd FileType tex setlocal shiftwidth=2 softtabstop=2 tabstop=2
autocmd FileType nasm setlocal noexpandtab
autocmd FileType go setlocal noexpandtab
autocmd FileType vimwiki setlocal shiftwidth=2 softtabstop=2 tabstop=2
" autocmd FileType vimwiki IndentLinesDisable
" autocmd FileType tex IndentLinesDisable
" autocmd FileType markdown IndentLinesDisable
" autocmd FileType json IndentLinesDisable
autocmd BufEnter *.notal setfiletype notal
autocmd BufEnter *.asm setfiletype nasm
