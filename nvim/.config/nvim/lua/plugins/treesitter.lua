return {
	enabled = false,
	'nvim-treesitter/nvim-treesitter',
	branch = 'main',
	lazy = false,
	build = ':TSUpdate',
	config = function()
		vim.api.nvim_create_autocmd('FileType', {
			callback = function()
				pcall(vim.treesitter.start)
			end,
		})

		vim.api.nvim_create_autocmd('FileType', {
			pattern = { 'org' },
			callback = function()
				vim.treesitter.start()
			end,
		})
	end,
}
