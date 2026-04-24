return {
	enabled = true,
	'TheNoeTrevino/haunt.nvim',
	---@class HauntConfig
	opts = {
		picker = 'auto', -- "auto", "snacks", "telescope", or "fzf"
		picker_keys = { -- picker agnostic, we got you covered
			delete = { key = 'x', mode = { 'n' } },
			edit_annotation = { key = 'e', mode = { 'n' } },
		},
	},
	keys = require('keybinds.plugins.haunt')
}
