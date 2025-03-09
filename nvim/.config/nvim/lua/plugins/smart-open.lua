return {
	enabled = require('helpers').not_vscode,
	'danielfalk/smart-open.nvim',
	branch = '0.2.x',
	-- keys = require('keybinds.plugins').telescope,
	config = function()
		require('telescope').load_extension('smart_open')
	end,
	dependencies = {
		'kkharji/sqlite.lua',
		'nvim-telescope/telescope.nvim',
		-- Only required if using match_algorithm fzf
		{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
		-- Optional.  If installed, native fzy will be used when match_algorithm is fzy
		-- { 'nvim-telescope/telescope-fzy-native.nvim' },
	},
}
