local fold = require('pretty-fold')
local foldKb = require('pretty-fold.preview')

fold.setup({
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
foldKb.setup_keybinding()
