local prefix = '<leader>m'

return {
	{
		prefix,
		group = 'Harpoon',
	},
	{
		prefix .. 'm',
		function()
			require('harpoon'):list():add()
		end,
		desc = 'Add file to Harpoon list',
	},
	{
		prefix .. 'f',
		function()
			harpoon = require('harpoon')
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end,
		desc = 'Open the Harpoon list',
	},
	{
		prefix .. 1,
		function()
			require('harpoon'):list():select(1)
		end,
		desc = 'Open the first file in Harpoon list',
	},
	{
		prefix .. 2,
		function()
			require('harpoon'):list():select(2)
		end,
		desc = 'Open the second file in Harpoon list',
	},
	{
		prefix .. 3,
		function()
			require('harpoon'):list():select(3)
		end,
		desc = 'Open the third file in Harpoon list',
	},
	{
		prefix .. 4,
		function()
			require('harpoon'):list():select(4)
		end,
		desc = 'Open the fourth file in Harpoon list',
	},
	{
		prefix .. 'n',
		function()
			require('harpoon'):list():next()
		end,
		desc = 'Open the next file in Harpoon list',
	},
	{
		prefix .. 'p',
		function()
			require('harpoon'):list():prev()
		end,
		desc = 'Open the previous file in Harpoon list',
	},
	{
		prefix .. 'r',
		function()
			require('harpoon'):list():remove()
		end,
		desc = 'Remove file from the Harpoon list',
	},
	{
		prefix .. 'c',
		function()
			require('harpoon'):list():clear()
		end,
		desc = 'Clear the Harpoon list',
	},
}

