return {
	'zbirenbaum/copilot.lua',
	cmd = 'Copilot',
	event = 'InsertEnter',
	keys = require('keybinds.plugins').copilot,
	opts = {
		suggestion = {
			auto_trigger = true,
			hide_during_completion = false,
			keymap = {
				next = '<M-]>',
				prev = '<M-[>',
			},
		},
	},
}
