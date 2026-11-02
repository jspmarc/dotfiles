return {
	enabled = require('helpers').not_vscode,
	'dlyongemallo/diffview-plus.nvim',
	cmd = {
		'DiffviewClose',
		'DiffviewFileHistory',
		'DiffviewOpen',
		'DiffviewLog',
		'DiffviewRefresh',
		'DiffviewFocusFiles',
		'DiffviewToggleFiles',
		'DiffviewMergeFiles',
		'DiffviewDiffDirs',
		'DiffviewWorktreeOverview',
	},
	keys = require('keybinds.plugins.diffview'),
}
