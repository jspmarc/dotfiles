return {
	enabled = false,
	'zbirenbaum/copilot.lua',
	cmd = 'Copilot',
	event = 'InsertEnter',
	keys = require('keybinds.plugins').copilot,
	opts = {
		suggestion = {
			auto_trigger = true,
			hide_during_completion = true,
			keymap = {
				next = '<M-]>',
				prev = '<M-[>',
			},
		},
		nes = {
			enabled = false, -- requires copilot-lsp as a dependency
			auto_trigger = false,
			keymap = {
				accept_and_goto = '<leader>p',
				accept = false,
				dismiss = '<Esc>',
			},
		},
	},
	requires = {
		'copilotlsp-nvim/copilot-lsp',
		init = function()
			vim.g.copilot_nes_debounce = 500
		end,
	},
}
