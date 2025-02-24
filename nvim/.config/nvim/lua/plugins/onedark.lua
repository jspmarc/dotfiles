return {
	'navarasu/onedark.nvim',
	event = 'VimEnter',
	config = function()
		require('onedark').setup({
			style = 'darker',
			transparent = false,
			ending_tildes = true,
			code_style = {
				comments = 'italic',
				keywords = 'none',
				functions = 'italic',
				strings = 'none',
				variables = 'bold',
			},
		})
		require('onedark').load()
	end,
}
