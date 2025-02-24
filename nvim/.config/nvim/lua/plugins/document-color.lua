return {
	'mrshmllow/document-color.nvim',
	event = 'BufEnter',
	config = function()
		require('document-color').setup({
			-- Default options
			mode = 'background', -- "background" | "foreground" | "single"
		})
	end,
}
