local api = vim.api
local M = {}

function M.map(mode, from, to, opts)
	local options = { noremap = true, silent = true }

	if opts then
		options = vim.tbl_extend('force', options, opts)
	end

	api.nvim_set_keymap(mode, from, to, options)
end

M.lsp_servers = {
	'bashls',
	'clangd',
	'cssls',
	'dockerls',
	'emmet_ls',
	'eslint',
	'gopls',
	'html',
	'jsonls',
	'pylsp',
	'rust_analyzer',
	'sumneko_lua',
	'svelte',
	'tailwindcss',
	'texlab',
	'tsserver',
	'volar',
}

M.null_ls_formatters = {
	'black',
	'clang_format',
	'prettier',
}

M.null_ls_linters = {
}

return M
