local prefix = '<leader>m'

return {
	{
		prefix,
		group = 'Marks and haunt.nvim',
	},
	{
		prefix .. 'm',
		function()
			require('haunt.api').annotate()
		end,
		desc = 'Annotate',
	},
	{
		prefix .. 't',
		function()
			require('haunt.api').toggle_annotation()
		end,
		desc = 'Toggle annotation',
	},
	{
		prefix .. 'T',
		function()
			require('haunt.api').toggle_all_lines()
		end,
		desc = 'Toggle all annotations',
	},
	{
		prefix .. 'd',
		function()
			require('haunt.api').delete()
		end,
		desc = 'Delete bookmark',
	},
	{
		prefix .. 'c',
		function()
			require('haunt.api').clear_all()
		end,
		desc = 'Delete all bookmarks',
	},
	{
		prefix .. '[',
		function()
			require('haunt.api').prev()
		end,
		desc = 'Previous bookmark',
	},
	{
		prefix .. ']',
		function()
			require('haunt.api').prev()
		end,
		desc = 'Next bookmark',
	},
	{
		prefix .. 'f',
		function()
			require('haunt.picker').show()
		end,
		desc = 'Show picker',
	},
	{
		prefix .. 'y',
		function()
			require('haunt.api').yank_locations({ current_buffer = true })
		end,
		desc = 'Send Hauntings to Clipboard (buffer)',
	},
	{
		prefix .. 'Y',
		function()
			require('haunt.api').yank_locations()
		end,
		desc = 'Send Hauntings to Clipboard (all)',
	},
}
