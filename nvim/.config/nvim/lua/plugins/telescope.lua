local plugin_keys = require('keybinds.plugins')

return {
	enabled = require('helpers').not_vscode,
	'nvim-telescope/telescope.nvim',
	keys = plugin_keys.telescope,
	dependencies = {
		'nvim-lua/plenary.nvim',
		{
			'nvim-telescope/telescope-fzf-native.nvim',
			build = 'make',
			config = function()
				require('telescope').load_extension('fzf')
			end,
		},
	},
	opts = {
		extensions = {
			fzf = {
				fuzzy = true,
				override_generic_sorter = true,
				override_file_sorter = true,
				case_mode = 'smart_case',
			},
		},
		pickers = {
			hidden = true,
		},
	},
}
