local group = vim.api.nvim_create_augroup('UserSessionManager', { clear = true })
vim.api.nvim_create_autocmd({ 'BufWritePre' }, {
	callback = function()
		for _, buf in ipairs(vim.api.nvim_list_bufs()) do
			-- Don't save while there's any 'nofile' buffer open.
			if vim.api.nvim_get_option_value('buftype', { buf = buf }) == 'nofile' then
				return
			end
		end
		require('session_manager').save_current_session()
	end,
	group = group,
})
vim.api.nvim_create_autocmd('SessionLoadPre', {
	callback = function()
		for _, client in ipairs(vim.lsp.get_clients()) do
			client:stop()
		end
	end,
	group = group,
})

return {
	'Shatur/neovim-session-manager',
	cmd = { 'SessionManager' },
	keys = require('keybinds.plugins').session_manager,
}
