return {
	'folke/trouble.nvim',
	requires = 'kyazdani42/nvim-web-devicons',
	config = function()
		require('trouble').setup({
			actions_keys = {
				open_split = { 's' },
				open_vsplit = { 'v' },
			},
		})
	end,
}
