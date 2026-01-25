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
-- @return: returns default branch or 'main' if the default branch can't be found
function M.get_default_branch_name()
	local res = vim.system({ 'git', 'symbolic-ref', 'refs/remotes/origin/HEAD' }, { capture_output = true }):wait()
	if res.code == 0 and res.stdout then
		return vim.fn.fnamemodify(res.stdout, ':t')
	else
		return 'main'
	end
end

-- Sets the colorscheme based on the current background setting
function M.set_colorscheme()
	if vim.o.background == 'dark' then
		vim.cmd('colorscheme ' .. M.themes.dark)
	else
		vim.cmd('colorscheme ' .. M.themes.light)
	end
end

--- Opens the Avante command menu with a list of AI-related commands
--- and executes the selected command.
---
--- This function defines a set of commands that interact with the Avante
--- plugin, including asking the AI about code, starting a chat session,
--- refreshing Avante windows, switching AI providers, showing the repository
--- map, and toggling the chat panel.
---
--- The function uses `vim.ui.select` to display a menu of these commands
--- and executes the chosen command based on user selection.
function M.open_avante_command_menu()
	-- Define the Avante commands
	local avante_commands = {
		{
			function()
				require('avante.api').toggle()
			end,
			'Toggle the chat panel',
		},
		{
			function()
				require('avante.api').ask({ new_chat = true })
			end,
			'Open a new chat',
		},
		{
			function()
				require('avante.api').ask()
			end,
			'Ask AI about code',
		},
		{
			function()
				require('avante.api').select_history()
			end,
			'Select from history',
		},
		{
			function()
				require('avante.model_selector').open()
			end,
			'Switch AI Provider',
		},
		{
			function()
				require('avante.api').refresh()
			end,
			'Refresh all Avante windows',
		},
		{
			function()
				vim.cmd('AvanteShowRepoMap')
			end,
			'Show the repository map',
		},
	}

	local options = vim.tbl_map(function(cmd)
		return cmd[2] -- Display text
	end, avante_commands)

	local function callback(choice)
		-- This function is called when the user makes a selection
		if not choice then
			return
		end

		-- Find the corresponding command
		local command = vim.tbl_filter(function(cmd)
			return cmd[2] == choice
		end, avante_commands)[1]
		if command then
			command[1]() -- Execute the command
		end
	end

	-- Call the ui.select menu
	vim.ui.select(options, { prompt = 'Avante Function: ' }, callback)
end

local mason_ignored = local_helpers.mason_ignored or {}

M.lsp_servers = local_helpers.lsp_servers or {}
M.mason_lsp = vim.tbl_filter(function(server)
	return not vim.tbl_contains(mason_ignored, server)
end, M.lsp_servers)
M.null_ls_formatters = local_helpers.null_ls_formatters or {}
M.null_ls_linters = local_helpers.null_ls_linters or {}
M.nvim_dap_servers = local_helpers.nvim_dap_servers or {}

M.not_vscode = not vim.g.vscode
M.not_neovide = not vim.g.neovide

M.themes = {
	dark = 'catppuccin-macchiato',
	light = 'catppuccin-latte',
}

M.is_mac = vim.fn.has('macunix') == 1

return M
