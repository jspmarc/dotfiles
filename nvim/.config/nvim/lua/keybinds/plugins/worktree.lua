local prefix = '<leader>gw'

return {
	{
		prefix,
		group = 'Git Worktrees',
	},
	{
		prefix .. 's',
		function()
			Snacks.picker.worktrees()
		end,
		desc = 'Open Git worktrees picker',
	},
	{
		prefix .. 'w',
		function()
			Snacks.picker.worktrees()
		end,
		desc = 'Open Git worktrees picker',
	},
	{
		prefix .. 'n',
		function()
			Snacks.picker.worktrees_new()
		end,
		desc = 'Create a new Git worktree',
	},
	{
		prefix .. 'r',
		function()
			Snacks.picker.worktrees_remove()
		end,
		desc = 'Remove a Git worktree',
	},
}

