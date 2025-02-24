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
		{ '<leader>gdd', ':DiffviewOpen<CR>' },
		{ '<leader>gdf', ':DiffviewFileHistory %<CR>' },
		{ '<leader>gdg', ':DiffviewFileHistory<CR>' },
		{ '<leader>gdc', ':DiffviewClose<CR>' },
	},
}
