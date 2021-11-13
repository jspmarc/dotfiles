local M = require'packer'.startup(function(use)
	use 'wbthomason/packer.nvim'

	-- sorted by plugin's name and then by author name

	-- B
	use 'akinsho/bufferline.nvim'

	-- D
	use 'glepnir/dashboard-nvim'

	-- K
	use 'b3nj5m1n/kommentary' -- tpope's kommentary in lua

	-- L
	use 'nvim-lualine/lualine.nvim'
	use 'neovim/nvim-lspconfig'

	-- N
	use { 'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate'
	}
	use { 'kyazdani42/nvim-tree.lua',
		config = function() require'nvim-tree'.setup {} end
	}
	use 'kyazdani42/nvim-web-devicons'

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

	-- V
	use { 'dracula/vim',
		as = 'dracula'
	}
    use 'houtsnip/vim-emacscommandline'
	use 'tpope/vim-surround'
end)

require'lsp.settings'
require'plugins._keybinds'
require'plugins.bufferline'
require'plugins.lualine'
require'plugins.nvim-tree'
require'plugins.nvim-treesitter'
require'plugins.nvim-web-devicons'
require'plugins.telescope'

return M
