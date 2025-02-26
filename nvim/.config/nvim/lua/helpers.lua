local success, local_helpers = pcall(require, 'local_helpers')
if not success then
	local_helpers = {}
end

local M = {}

function M.map(mode, from, to, opts)
	local options = { noremap = true, silent = true }

	if opts then
		options = vim.tbl_extend('force', options, opts)
	end

	vim.api.nvim_set_keymap(mode, from, to, options)
end

function M.get_default_branch_name()
	local res = vim
		.system({ 'git', 'rev-parse', '--verify', 'main' }, { capture_output = true })
		:wait()
	return res.code == 0 and 'main' or 'master'
end

if local_helpers.lsp_servers then
	M.lsp_servers = local_helpers.lsp_servers
else
	M.lsp_servers = {
		'bashls',
		'lua_ls',
	}
end

if local_helpers.null_ls_formatters then
	M.null_ls_formatters = local_helpers.null_ls_formatters
else
	M.null_ls_formatters = {}
end

if local_helpers.null_ls_linters then
	M.null_ls_linters = local_helpers.null_ls_linters
else
	M.null_ls_linters = {}
end

return M
