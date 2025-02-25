return {
	'sindrets/diffview.nvim',
	cmd = {
		'DiffviewClose',
		'DiffviewFileHistory',
		'DiffviewOpen',
		'DiffviewLog',
		'DiffviewRefresh',
		'DiffviewFocusFiles',
		'DiffviewToggleFiles',
	},
	keys = {
		{ '<leader>do', ':DiffviewOpen<CR>',          desc = 'Open diffview' },
		{ '<leader>df', ':DiffviewFileHistory %<CR>', desc = 'Open diffview history for file' },
		{ '<leader>dg', ':DiffviewFileHistory<CR>',   desc = 'Open diffview history for repo' },
		{ '<leader>dc', ':DiffviewClose<CR>',         desc = 'Close diffview' },
	},
}
