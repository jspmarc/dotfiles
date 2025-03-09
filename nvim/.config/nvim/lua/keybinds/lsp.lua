local plugin_keys = require('keybinds.plugins')

return vim.list_extend({
	{ 'ge', function() vim.diagnostic.open_float() end },
	{ 'gD', function() vim.lsp.buf.declaration() end },
	{ 'gh', function() vim.lsp.buf.hover() end },
	{ '<C-k>', function() vim.lsp.buf.signature_help() end },
	{ '<A-CR>', function() vim.lsp.buf.code_action() end, mode = { 'n', 'v' } },
	{ '<leader>la', function() vim.lsp.buf.code_action() end, mode = { 'n', 'v' } },
	{ '<leader>lf', function() vim.lsp.buf.format({ async = true }) end },
	{ '<leader>lp', function() vim.diagnostic.open_float() end },
	{ '<leader>lq', function() vim.diagnostic.setloclist() end },
	{ '<leader>lr', function() vim.lsp.buf.rename() end },
	{ '<F2>', function() vim.lsp.buf.rename() end },
	-- TODO: use proxy
	{ '<F6>', function() vim.lsp.buf.rename() end },
}, plugin_keys.telescope_lsp)
