local get_default_branch_name = require('helpers').get_default_branch_name

return {
	enabled = require('helpers').not_vscode,
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
		{ '<leader>dc', '<cmd>DiffviewClose<CR>',                  desc = 'Close diffview' },
		{ '<leader>df', '<cmd>DiffviewFileHistory --follow %<CR>', desc = 'Open diffview history for file' },
		{ '<leader>dh', '<cmd>DiffviewFileHistory<CR>',            desc = 'Open diffview history for repo' },
		{
			'<leader>dl',
			"<Esc><cmd>'<,'>DiffviewFileHistory --follow<CR>",
			mode = 'v',
			desc = 'Open diffview history for selection',
		},
		{ '<leader>dl', '<Cmd>.DiffviewFileHistory --follow<CR>', desc = 'Open diffview history for line' },
		{
			'<leader>dm',
			function()
				vim.cmd('DiffviewOpen ' .. get_default_branch_name())
			end,
			desc = 'Open diffview against master',
		},
		{
			'<leader>dM',
			function()
				vim.cmd('DiffviewOpen HEAD..origin/' .. get_default_branch_name())
			end,
			desc = 'Open diffview against remote master',
		},
		{ '<leader>do', '<cmd>DiffviewOpen<CR>',        desc = 'Open diffview' },
	},
}
