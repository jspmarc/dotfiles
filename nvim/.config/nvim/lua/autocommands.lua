local autocmds = vim.api.nvim_create_augroup('autocmds', { clear = true })

vim.api.nvim_create_autocmd('BufWritePost', {
	pattern = '*.tex',
	command = 'TexlabBuild',
	group = autocmds,
})
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
	pattern = { 'gitcommit', },
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
