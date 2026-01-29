return {
	'TheNoeTrevino/haunt.nvim',
	---@class HauntConfig
	opts = {
		sign = '󱙝',
		sign_hl = 'DiagnosticInfo',
		virt_text_hl = 'HauntAnnotation', -- links to DiagnosticVirtualTextHint
		annotation_prefix = ' 󰆉 ',
		line_hl = nil,
		virt_text_pos = 'eol',
		data_dir = nil,
		per_branch_bookmarks = true,
		picker = 'auto', -- "auto", "snacks", "telescope", or "fzf"
		picker_keys = { -- picker agnostic, we got you covered
			delete = { key = 'x', mode = { 'n' } },
			edit_annotation = { key = 'e', mode = { 'n' } },
		},
	},
	keys = require('keybinds.plugins.haunt')
}
