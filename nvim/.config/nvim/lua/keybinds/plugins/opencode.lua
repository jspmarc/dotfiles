return {
	{
		'<leader>cl',
		function()
			require('opencode.api').toggle()
		end,
		desc = 'Toggle opencode',
		mode = 'n',
	},
	{
		'<leader>cc',
		function()
			require('opencode.api').quick_chat()
		end,
		desc = 'Quick chat',
		mode = {'n', 'x'},
	},
	{
		'<leader>ca',
		function()
			require('opencode.api').add_visual_selection()
		end,
		desc = 'Add selection to opencode context',
		mode = 'x',
	},
}
