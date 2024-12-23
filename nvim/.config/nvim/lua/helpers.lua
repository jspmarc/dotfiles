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
	'gopls',
	'html',
	'jsonls',
	'lua_ls',
	'pyright',
	'rust_analyzer',
	'svelte',
	'tailwindcss',
	'ts_ls',
	'volar',
}

M.null_ls_formatters = {
	'black',
	'clang_format',
	'prettier',
	'stylua',
}

M.null_ls_linters = {
	'flake8',
}

return M
