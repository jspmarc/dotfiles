return {
	'Juksuu/worktrees.nvim',
	keys = require('keybinds.plugins.worktree'),
	cmd = {
		'GitWorktreeSwitch',
		'GitWorktreeCreate',
		'GitWorktreeCreateExisting',
		'GitWorktreeRemove',
	},
	opts = {
		swap_current_buffer = false,
		hooks = {
			on_before_switch = function()
				require('session_manager').save_current_session()
				vim.cmd('silent! %bwipeout!')
				for _, client in ipairs(vim.lsp.get_clients()) do
					client:stop()
				end
			end,

			on_switch = function()
				require('session_manager').load_git_session()
			end,

			on_before_remove = function()
				require('session_manager').delete_current_dir_session()
			end,
		},
	},
	dependencies = {
		-- Required.
		'nvim-lua/plenary.nvim',
	},
}
