local file_types = { 'markdown', 'Avante', 'codecompanion', 'opencode_output' }

return {
	'MeanderingProgrammer/render-markdown.nvim',
	ft = file_types,
	dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
	opts = {
		anti_conceal = { enabled = false },
		file_types = file_types,
	},
}
