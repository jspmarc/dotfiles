return {
	'epwalsh/obsidian.nvim',
	version = '*', -- recommended, use latest release instead of latest commit
	lazy = true,
	event = {
	  "BufReadPre " .. vim.fn.expand("~") .. "/Documents/2nd Brain/**/*.md",
	  "BufNewFile " .. vim.fn.expand("~") .. "/Documents/2nd Brain/**/*.md",
	},
	dependencies = {
		-- Required.
		'nvim-lua/plenary.nvim',
	},
	opts = {
		workspaces = {
			{
				name = '2nd brain',
				path = '~/Documents/2nd Brain',
			},
		},
		disable_frontmatter = true,
	},
}
