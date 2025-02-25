return {
	'stevearc/aerial.nvim',
	cmd = {
		'AerialGo',
		'AerialInfo',
		'AerialNext',
		'AerialPrev',
		'AerialOpen',
		'AerialClose',
		'AerialOpenAll',
		'AerialCloseAll',
		'AerialToggle',
		'AerialNavToggle',
		'AerialNavOpen',
		'AerialNavClose',
	},
	keys = {
		{ '<leader>s', '<cmd>AerialToggle<CR>', desc = 'Open Buffer Outline Window' },
		{ '<leader>S', '<cmd>AerialNavToggle<CR>', desc = 'Open Buffer Outline Window (Floating)' },
	},
	opts = {},
	-- Optional dependencies
	dependencies = {
		'nvim-treesitter/nvim-treesitter',
		'nvim-tree/nvim-web-devicons',
	},
}
