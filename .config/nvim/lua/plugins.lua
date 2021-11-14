local M = require'packer'.startup(function(use)
	use 'wbthomason/packer.nvim'

	-- sorted by plugin's name and then by author name
	-- `nvim` and `vim` prefix are treated as if they don't exist

	-- B
	use 'akinsho/bufferline.nvim'

	-- D
	use 'glepnir/dashboard-nvim'

	-- E
	use 'easymotion/vim-easymotion'
    use 'houtsnip/vim-emacscommandline'

	-- K
	use 'b3nj5m1n/kommentary' -- tpope's kommentary in lua

	-- L
	use 'nvim-lualine/lualine.nvim'
	use 'neovim/nvim-lspconfig'

	-- S
	use 'tpope/vim-surround'

	-- T
	use { 'nvim-telescope/telescope.nvim',
		requires = { {'nvim-lua/plenary.nvim'} }
	}
	use { 'nvim-telescope/telescope-fzf-native.nvim',
		run = 'make',
	}
	use { "nvim-telescope/telescope-frecency.nvim",
		config = function()
			require"telescope".load_extension("frecency")
		end,
		requires = {"tami5/sqlite.lua"}
	}
	use { 'kyazdani42/nvim-tree.lua',
		config = function() require'nvim-tree'.setup {} end
	}
	use { 'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate'
	}

	-- V
	use { 'dracula/vim',
		as = 'dracula'
	}

	-- W
	use 'kyazdani42/nvim-web-devicons'
end)

require'lsp.settings'
require'plugins.0keybinds'
require'plugins.bufferline'
require'plugins.dashboard'
require'plugins.lualine'
require'plugins.nvim-tree'
require'plugins.nvim-treesitter'
require'plugins.nvim-web-devicons'
require'plugins.telescope'

return M
