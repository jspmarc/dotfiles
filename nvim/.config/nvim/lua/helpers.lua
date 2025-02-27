local success, local_helpers = pcall(require, 'local_helpers')
if not success then
	local_helpers = {}
end

local M = {}

-- Maps a key combination to a command
-- @param mode: The mode in which the mapping is active (e.g., 'n' for normal mode)
-- @param from: The key combination to map from
-- @param to: The command to execute
-- @param opts: Optional table of additional options
function M.map(mode, from, to, opts)
	local options = { noremap = true, silent = true }

	if opts then
		options = vim.tbl_extend('force', options, opts)
	end

	vim.api.nvim_set_keymap(mode, from, to, options)
end

-- Gets the default branch name of the current git repository
-- @return: 'main' if it exists, otherwise 'master'
function M.get_default_branch_name()
	local res = vim.system({ 'git', 'rev-parse', '--verify', 'main' }, { capture_output = true }):wait()
	return res.code == 0 and 'main' or 'master'
end

-- Sets the colorscheme based on the current background setting
function M.set_colorscheme()
	if vim.o.background == 'dark' then
		require('onedark').load()
	else
		vim.cmd('colorscheme catppuccin-latte')
	end
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
