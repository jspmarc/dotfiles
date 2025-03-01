return {
	enabled = require('helpers').not_vscode,
	'mrshmllow/document-color.nvim',
	ft = { 'css', 'html', 'javascriptreact', 'typescriptreact', 'vue', 'svelte' },
	config = function()
		require('document-color').setup({
			-- Default options
			mode = 'background', -- "background" | "foreground" | "single"
		})
	end,
}
