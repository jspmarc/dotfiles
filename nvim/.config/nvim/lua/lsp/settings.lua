require('nvim-lsp-installer').setup({
	automatic_installation = true,
})
local nvim_lsp = require('lspconfig')
require('lsp.keybinds')
local util = require('lspconfig.util')
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

local servers = {
	'bashls',
	'clangd',
	'cssls',
	'dockerls',
	'emmet_ls',
	'eslint',
	'gopls',
	'html',
	'jedi_language_server',
	'jsonls',
	'pylsp',
	'rust_analyzer',
	'sumneko_lua',
	'svelte',
	'tailwindcss',
	'texlab',
	'tsserver',
	'volar',
}

for _, server in ipairs(servers) do
	local opts = {
		capabilities = capabilities,
	}

	if server == 'clangd' then
		opts = vim.tbl_extend('force', opts, {
			filetypes = { 'c', 'cpp', 'objc', 'objcpp', 'cuda' },
		})
	elseif server == 'dockerls' then
		opts = vim.tbl_extend('force', opts, {
			filetypes = { 'dockerfile', 'Dockerfile' },
			root_dir = util.root_pattern('dockerfile', 'Dockerfile'),
		})
	elseif server == 'emmet_ls' then
		opts = vim.tbl_extend('force', opts, {
			filetypes = { 'html', 'css', 'javascriptreact', 'typescriptreact' },
		})
	elseif server == 'rust_analyzer' then
		opts = vim.tbl_extend('force', opts, require('lsp.rust'))
	end

	nvim_lsp[server].setup(opts)
end
