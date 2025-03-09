local plugin_keys = require('keybinds.plugins')

return {
	enabled = require('helpers').not_vscode,
	'nvim-telescope/telescope.nvim',
	keys = vim.list_extend(plugin_keys.telescope, plugin_keys.telescope_lsp),
	cmd = { 'Telescope' },
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
