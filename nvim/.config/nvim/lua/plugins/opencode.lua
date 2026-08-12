local plugin_keys = require('keybinds.plugins')
local settings = require('settings')

return {
	'NickvanDyke/opencode.nvim',
	dependencies = {
		-- Recommended for `ask()` and `select()`.
		-- Required for `snacks` provider.
		---@module 'snacks' <- Loads `snacks.nvim` types for configuration intellisense.
		{ 'folke/snacks.nvim', opts = { input = {}, picker = {}, terminal = {} } },
	},
	keys = plugin_keys.opencode,
	config = function()
		local oc_settings = settings.opencode
		---@type opencode.Opts
		vim.g.opencode_opts = {
			-- Your configuration, if any — see `lua/opencode/config.lua`, or "goto definition".
			start = function()
				require('snacks.terminal').open(
					oc_settings.cmd,
					oc_settings.snacks_terminal_opts
				)
			end,
		}
		-- Required for `opts.events.reload`.
		vim.o.autoread = true
	end,
}
