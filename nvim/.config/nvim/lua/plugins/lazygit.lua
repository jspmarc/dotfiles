return {
	'kdheepak/lazygit.nvim',
	cmd = {
		'LazyGit',
		'LazyGitLog',
		'LazyGitConfig',
		'LazyGitFilter',
		'LazyGitFilterCurrentFile',
		'LazyGitCurrentFile',
	},
	keys = {
		{ '<leader>gg', '<cmd>LazyGit<CR>', desc = 'Open lazy git' },
	},
	-- optional for floating window border decoration
	requires = {
		'nvim-lua/plenary.nvim',
	},
}
