local plugin_keys = require('keybinds.plugins')

local state = require('telescope.state')
local action_state = require('telescope.actions.state')

local function scroll(prompt_bufnr, direction)
	local previewer = action_state.get_current_picker(prompt_bufnr).previewer
	local status = state.get_status(prompt_bufnr)

	-- Check if we actually have a previewer and a preview window
	if type(previewer) ~= 'table' or previewer.scroll_fn == nil or status.preview_win == nil then
		return
	end

	-- local speed = full_page and vim.api.nvim_win_get_height(status.preview_win) or 1
	local speed = 1
	previewer:scroll_fn(speed * direction)
end

local additional_scroll = {
	-- ['<C-b>'] = function(bufnr)
	-- 	-- go down full page
	-- 	scroll(bufnr, -1, true)
	-- end,
	-- ['<C-f>'] = function(bufnr)
	-- 	-- go up full page
	-- 	scroll(bufnr, 1, true)
	-- end,
	['<C-e>'] = function(bufnr)
		-- go up one line
		scroll(bufnr, 1)
	end,
	['<C-y>'] = function(bufnr)
		-- go down one line
		scroll(bufnr, -1)
	end,
}

return {
	enabled = require('helpers').not_vscode,
	'nvim-telescope/telescope.nvim',
	-- keys = vim.list_extend(plugin_keys.telescope, plugin_keys.telescope_lsp),
	cmd = { 'Telescope' },
	dependencies = {
		'nvim-lua/plenary.nvim',
		{
			'nvim-telescope/telescope-fzf-native.nvim',
			build = 'make',
			config = function()
				require('telescope').load_extension('fzf')
			end,
		},
	},
	opts = {
		defaults = {
			mappings = {
				i = additional_scroll,
				n = additional_scroll,
			},
		},
		extensions = {
			fzf = {
				fuzzy = true,
				override_generic_sorter = true,
				override_file_sorter = true,
				case_mode = 'smart_case',
			},
		},
		pickers = {
			hidden = true,
		},
	},
}
