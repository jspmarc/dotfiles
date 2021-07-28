local plugins = require'packer'.startup(function(use)
    use 'wbthomason/packer.nvim'

    use 'LunarWatcher/auto-pairs' -- Auto (), [], {}, etc
    use 'turbio/bracey.vim' -- local 'deployment' for HTML file
    use 'glepnir/dashboard-nvim' -- pretty start menu
    use {
        'junegunn/fzf',
    	run=[[fzf#install()]]
    } -- enables FZF in Vim
    use 'b3nj5m1n/kommentary' -- tpope's commentary but in lua
    use 'Yggdroot/indentLine' -- Indent line
    use {
        'iamcco/markdown-preview.nvim',
        run='cd app & yarn install'
    } -- Preview GH style markdown
    use 'sbdchd/neoformat' -- Formatter
    use 'scrooloose/nerdtree' -- File explorer
    use 'chr4/nginx.vim' -- Nginx highlighting
    use 'romgrk/nvim-treesitter-context' -- Always show context
    use 'kyazdani42/nvim-tree.lua' -- File explorer
    use {
        'nvim-treesitter/nvim-treesitter',
        run=':TSUpdate'
    } -- Nvim treesitter
    use 'kyazdani42/nvim-web-devicons'
    use 'nvim-lua/plenary.nvim'
    use 'nvim-lua/popup.nvim'
    use 'nvim-telescope/telescope.nvim'
    use 'easymotion/vim-easymotion' -- jump jump
    use 'voldikss/vim-floaterm' -- floating terminal
    use 'tpope/vim-fugitive' -- show git status in statusline and other git integration
    use 'airblade/vim-gitgutter' -- Manage changes in hunks
    use 'simnalamburt/vim-mundo' -- browse past saves
    use 'tpope/vim-surround' -- modify things inside brackets and quotations faster
    use 'houtsnip/vim-emacscommandline' -- emacs key binding for the command line
    use 'psliwka/vim-smoothie' -- smooth scroll
    use 'lervag/vimtex' -- vim syntax highlighting for tex
    use 'hrsh7th/vim-vsnip' -- Snippets

    -- NVIM Lsp
    use 'hrsh7th/nvim-compe' -- completion for LSP
    use 'glepnir/lspsaga.nvim' -- cool features for nvim lsp
    use 'neovim/nvim-lspconfig' -- The Nvim LSP
    use 'ray-x/lsp_signature.nvim'
    use 'folke/lsp-trouble.nvim'

   -- Theme-related
    use 'navarasu/onedark.nvim'
    use 'morhetz/gruvbox' -- gruvbox color scheme
    use 'vim-airline/vim-airline' -- pretty status line
    use 'vim-airline/vim-airline-themes' -- pretty status line, now prettier
    use 'tomasiser/vim-code-dark'
end)

require'plugins/airline'
require'plugins/bracey'
require'plugins/dashboard'
require'plugins/easymotion'
require'plugins/floaterm'
require'plugins/fugitive'
require'plugins/git-gutter'
require'plugins/indentLine'
require'plugins/kommentary'
require'plugins/mundo'
require'plugins/Neoformat'
require'plugins/NERDTree'
require'plugins/nvim-treesitter'
require'plugins/telescope'
require'plugins/vimtex'

require'lsp_signature'.on_attach()

-- Nvim lsp
require'plugins/lspsaga'
require'plugins/nvim-lsp'
require'plugins/nvim-compe'
require'plugins/lsp-trouble'

-- TODO
--require'plugins/startify' -- broken
--require'plugins/vimwiki' -- broken too

return plugins
