return {
	'zbirenbaum/copilot.lua',
	cmd = 'Copilot',
	event = 'InsertEnter',
	opts = {
		suggestion = {
			auto_trigger = true,
			hide_during_completion = false,
			keymap = {
				accept = '<Tab>',
				next = '<M-]>',
				prev = '<M-[>',
			},
		},
	},
}
