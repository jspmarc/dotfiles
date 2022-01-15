local M = require('packer').startup(function(use)
	use('wbthomason/packer.nvim')

	-- sorted by plugin's name and then by author name
	-- `nvim` and `vim` prefix are treated as if they don't exist

	-- B
	use('akinsho/bufferline.nvim')

	-- C
	use('hrsh7th/nvim-cmp')
	use('hrsh7th/cmp-nvim-lsp')
	use('hrsh7th/cmp-buffer')
	use('hrsh7th/cmp-path')
	use('hrsh7th/cmp-cmdline')
	use('saadparwaiz1/cmp_luasnip')
	use('ap/vim-css-color')

	-- D
	use('glepnir/dashboard-nvim')
	use('ekalinin/Dockerfile.vim')
	use('Mofiqul/dracula.nvim')

	-- E
	use('easymotion/vim-easymotion')
	use('houtsnip/vim-emacscommandline')
	use('mattn/emmet-vim')

	-- F
	use('voldikss/vim-floaterm')
	use('tpope/vim-fugitive')

	-- G
	use({
		'lewis6991/gitsigns.nvim',
		requires = {
			'nvim-lua/plenary.nvim',
		},
		config = function()
			require('gitsigns').setup()
		end,
	})

	-- I
	use('lukas-reineke/indent-blankline.nvim')

	-- K
	use('b3nj5m1n/kommentary') -- tpope's kommentary in lua

	-- L
	use('nvim-lualine/lualine.nvim')
	use('L3MON4D3/LuaSnip')
	use('williamboman/nvim-lsp-installer')
	use('neovim/nvim-lspconfig')

	-- M
	use({ 'iamcco/markdown-preview.nvim', run = 'cd app && yarn install' })

	-- N
	-- use('sbdchd/neoformat')
	-- use('rcarriga/nvim-notify')

	-- O
	use('navarasu/onedark.nvim')

	-- P
	use('andweeb/presence.nvim')
	use('anuvyklack/pretty-fold.nvim')

	-- S
	use('tpope/vim-surround')
	use('tpope/vim-sleuth')
	use('petertriho/nvim-scrollbar')

	-- T
	use({ 'nvim-telescope/telescope.nvim', requires = 'nvim-lua/plenary.nvim' })
	use({ 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' })
	use({
		'nvim-telescope/telescope-frecency.nvim',
		requires = { 'tami5/sqlite.lua' },
	})
	use({ 'folke/todo-comments.nvim', requires = 'nvim-lua/plenary.nvim' })
	use('kyazdani42/nvim-tree.lua')
	use({ 'folke/trouble.nvim', requires = 'kyazdani42/nvim-web-devicons' })

	use({ 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' })

	-- W
	use('kyazdani42/nvim-web-devicons')
end)

require('plugins.0keybinds')
require('plugins.bufferline')
require('plugins.nvim-cmp')
require('plugins.dashboard')
require('plugins.vim-floaterm')
require('plugins.lualine')
require('plugins.presence-nvim')
require('plugins.nvim-tree')
require('plugins.nvim-treesitter')
require('plugins.telescope')
require('plugins.nvim-web-devicons')
require('lsp.settings')

return M
