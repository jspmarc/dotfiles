return {
	'navarasu/onedark.nvim',
	priority = 1000,
	lazy = false,
	opts = {
			-- style = 'darker',
			style = 'light',
			transparent = false,
			ending_tildes = true,
			code_style = {
				comments = 'italic',
				keywords = 'none',
				functions = 'italic',
				strings = 'none',
				variables = 'bold',
			},
	},
	config = function(_, opts)
		require('onedark').setup(opts)
		require('onedark').load()
	end,
}
