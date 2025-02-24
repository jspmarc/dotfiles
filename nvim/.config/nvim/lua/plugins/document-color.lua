return {
	'mrshmllow/document-color.nvim',
	ft = { 'css', 'html', 'javascriptreact', 'typescriptreact', 'vue', 'svelte' },
	config = function()
		require('document-color').setup({
			-- Default options
			mode = 'background', -- "background" | "foreground" | "single"
		})
	end,
}
