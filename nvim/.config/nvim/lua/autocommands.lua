local autocmds = vim.api.nvim_create_augroup('autocmds', { clear = true })
local set_colorscheme = require('helpers').set_colorscheme

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
