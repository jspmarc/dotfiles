local autocmds = vim.api.nvim_create_augroup('autocmds', { clear = true })

-- vim.api.nvim_create_autocmd('CursorHold', {
-- 	pattern = '*',
-- 	callback = vim.diagnostic.open_float,
-- 	group = autocmds,
-- })
vim.api.nvim_create_autocmd('FileType', {
	pattern = '*.asm',
	command = 'setfiletype nasm',
	group = autocmds,
})
vim.api.nvim_create_autocmd('FileType', {
	pattern = '*.notal',
	command = 'setfiletype notal',
	group = autocmds,
})
vim.api.nvim_create_autocmd('FileType', {
	pattern = 'org',
	command = 'setlocal tabstop=2 shiftwidth=2 expandtab',
	group = autocmds,
})
-- vim.api.nvim_create_autocmd('FileType', {
-- 	pattern = 'svelte,vue',
-- 	command = 'setlocal tabstop=2 shiftwidth=2',
-- 	group = autocmds,
-- })
vim.api.nvim_create_autocmd('FileType', {
	pattern = { 'gitcommit' },
	command = 'startinsert | 1',
	desc = 'Start commit message in insert mode',
	group = autocmds,
})
vim.api.nvim_create_autocmd('TextYankPost', {
	pattern = '*',
	callback = function()
		vim.highlight.on_yank({
			higroup = 'IncSearch',
			timeout = 200,
		})
	end,
	desc = 'Highlight yanks',
	group = autocmds,
})
-- Auto save session
vim.api.nvim_create_autocmd({ 'BufWritePre' }, {
  callback = function ()
    for _, buf in ipairs(vim.api.nvim_list_bufs()) do
      -- Don't save while there's any 'nofile' buffer open.
      if vim.api.nvim_get_option_value("buftype", { buf = buf }) == 'nofile' then
        return
      end
    end
    require('session_manager').save_current_session()
  end
})
