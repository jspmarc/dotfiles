require('pretty-fold').setup({
	keep_indentation = true,
	fill_char = '━',
	comment_signs = false,
	remove_fold_markers = true,
	sections = {
		left = {
			'━ ',
			function()
				return string.rep('*', vim.v.foldlevel)
			end,
			' ━┫',
			'content',
			'┣',
			'━',
			'━',
			'━',
			'━',
			'┫ ',
			'number_of_folded_lines',
			' ┣━━',
		},
		right = {
			'┫ ',
			'percentage',
			' ┣━━',
		},
	},
})
require('pretty-fold.preview').setup()
