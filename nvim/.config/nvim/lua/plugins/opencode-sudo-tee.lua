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
		-- `window_width` must be a ratio (0-1], so convert 100 columns to a ratio
		return {
			-- Keymaps are defined in keybinds/plugins/opencode.lua
			default_global_keymaps = false,
			keymap = {
				input_window = {
					['<cr>'] = { 'submit_input_prompt', mode = { 'n', 'i' }, desc = 'Submit prompt' },
					['<esc>'] = false, -- don't close the window on <Esc>
				},
				output_window = {
					['<esc>'] = false, -- don't close the window on <Esc>
				},
			},
			ui = {
				position = 'right',
				window_width = 0.25,
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
