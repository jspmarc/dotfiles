return {
	enabled = true,
	'sudo-tee/opencode.nvim',
	dependencies = {
		-- Recommended for `ask()` and `select()`.
		-- Required for `snacks` provider.
		---@module 'snacks' <- Loads `snacks.nvim` types for configuration intellisense.
		{ 'folke/snacks.nvim' },
		{ 'MeanderingProgrammer/render-markdown.nvim' }
	},
	keys = require('keybinds.plugins.opencode'),
	opts = function()
		-- `window_width` must be a ratio (0-1], so convert min_width columns to a ratio
		local min_width = 80
		return {
			-- Keymaps are defined in keybinds/plugins/opencode.lua
			default_global_keymaps = false,
			keymap = {
				input_window = {
					['<esc>'] = false, -- don't close the window on <Esc>
				},
				output_window = {
					['<esc>'] = false, -- don't close the window on <Esc>
				},
			},
			ui = {
				position = 'right',
				window_width = math.max(min_width / vim.o.columns, 0.25),
				input = {
					text = { wrap = true },
				},
				output = {
					tools = {
						folding_threshold = 5,
						show_reasoning_output = false,
					},
				},
			},
		}
	end,
}
