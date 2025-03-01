local success, local_helpers = pcall(require, 'local_helpers')
if not success then
	local_helpers = {}
end

local M = {}

---Maps a key combination to a command
---@param mode string|string[] The mode(s) in which the mapping is active (e.g., 'n' for normal mode or {'n', 'v'} for normal and visual)
---@param from string The key combination to map from
---@param to string|function The command to execute
---@param opts table|nil Optional table containing additional map options and which-key options
function M.map(mode, from, to, opts)
	local options = { noremap = true, silent = true }
	local modes = type(mode) == 'table' and mode or { mode }

	if opts then
		options = vim.tbl_extend('force', options, opts)
	end

	for _, m in ipairs(modes) do
		if type(to) == 'function' then
			---@diagnostic disable-next-line: param-type-mismatch
			vim.api.nvim_set_keymap(m, from, '', vim.tbl_extend('force', options, { callback = to }))
		else
			---@diagnostic disable-next-line: param-type-mismatch
			vim.api.nvim_set_keymap(m, from, to, options)
		end
	end
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
		vim.cmd('colorscheme catppuccin-macchiato')
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

M.not_vscode = not vim.g.vscode

return M
