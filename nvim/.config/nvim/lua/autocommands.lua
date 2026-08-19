-- This file is for general autocommands. For specific plugin autocommands, please check the
-- plugin's configuration file. For LSP-related autocommands, please check the lsp/init.lua file.

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
	pattern = 'markdown',
	command = 'setlocal wrap tabstop=2 shiftwidth=2 noexpandtab',
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
vim.api.nvim_create_autocmd('DirChanged', {
	callback = function()
		local project_bookmarks = vim.fn.getcwd() .. '/.haunts/'
		require('haunt.api').change_data_dir(project_bookmarks)
	end,
})
