local M = require'packer'.startup(function(use)
	use 'wbthomason/packer.nvim'

	-- sorted by plugin's name and then by author name
	-- `nvim` and `vim` prefix are treated as if they don't exist

	-- B
	use 'akinsho/bufferline.nvim'

	-- C
	--[[ use {'ms-jpq/coq_nvim', branch = 'coq'}
	use {'ms-jpq/coq.artifacts', branch = 'artifacts'}
	use {'ms-jpq/coq.thirdparty', branch = '3p'} ]]
	use 'hrsh7th/nvim-cmp'
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/cmp-cmdline'
	use 'saadparwaiz1/cmp_luasnip'

	-- D
	use 'glepnir/dashboard-nvim'
	use 'ekalinin/Dockerfile.vim'

	-- E
	use 'easymotion/vim-easymotion'
	use 'houtsnip/vim-emacscommandline'

	-- F
	use 'voldikss/vim-floaterm'
	use 'tpope/vim-fugitive'

	-- G
	use 'airblade/vim-gitgutter'

	-- K
	use 'b3nj5m1n/kommentary' -- tpope's kommentary in lua

	-- L
	use 'nvim-lualine/lualine.nvim'
	use 'L3MON4D3/LuaSnip'
	use 'williamboman/nvim-lsp-installer'
	use 'neovim/nvim-lspconfig'

	-- M
	use { 'iamcco/markdown-preview.nvim',  run = 'cd app && yarn install'  }

	-- N
	use 'sbdchd/neoformat'

	-- S
	use 'tpope/vim-surround'

	-- T
	use { 'nvim-telescope/telescope.nvim',
		requires = { {'nvim-lua/plenary.nvim'} }
	}
	use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make', }
	use { "nvim-telescope/telescope-frecency.nvim",
		config = function()
			require"telescope".load_extension("frecency")
		end,
		requires = {"tami5/sqlite.lua"}
	}
	use { 'kyazdani42/nvim-tree.lua',
		config = function() require'nvim-tree'.setup {} end
	}
	use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

	-- V
	use { 'dracula/vim', as = 'dracula' }

	-- W
	use 'kyazdani42/nvim-web-devicons'
end)

require'plugins.0keybinds'
require'plugins.bufferline'
require'plugins.nvim-cmp'
require'plugins.dashboard'
require'plugins.vim-floaterm'
require'plugins.lualine'
require'plugins.nvim-tree'
require'plugins.nvim-treesitter'
require'plugins.telescope'
require'plugins.nvim-web-devicons'
require'lsp.settings'

return M
