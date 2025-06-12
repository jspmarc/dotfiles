local plugin_keys = require('keybinds.plugins')

return {
	'christoomey/vim-tmux-navigator',
	cmd = {
		'TmuxNavigateLeft',
		'TmuxNavigateDown',
		'TmuxNavigateUp',
		'TmuxNavigateRight',
		'TmuxNavigatePrevious',
		'TmuxNavigatorProcessList',
	},
	keys = plugin_keys['tmux-navigator'],
}
