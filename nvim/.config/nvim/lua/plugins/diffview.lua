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
		{ '<leader>gdd', ':DiffviewOpen<CR>',          desc = 'Open diffview' },
		{ '<leader>gdf', ':DiffviewFileHistory %<CR>', desc = 'Open diffview history for file' },
		{ '<leader>gdg', ':DiffviewFileHistory<CR>',   desc = 'Open diffview history for repo' },
		{ '<leader>gdc', ':DiffviewClose<CR>',         desc = 'Close diffview' },
	},
}
