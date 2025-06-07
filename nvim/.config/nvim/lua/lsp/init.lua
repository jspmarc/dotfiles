local nvim_lsp = vim.lsp
local util = require('lspconfig.util')
local capabilities = require('cmp_nvim_lsp').default_capabilities()

local servers = require('helpers').lsp_servers
nvim_lsp.enable(servers)

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
	elseif server == 'lua_ls' then
		opts = vim.tbl_extend('force', opts, require('lsp.lua'))
	elseif server == 'pylsp' then
		opts = vim.tbl_extend('force', opts, require('lsp.pylsp'))
	elseif server == 'rust_analyzer' then
		opts = vim.tbl_extend('force', opts, require('lsp.rust'))
	elseif server == 'tailwindcss' then
		opts = vim.tbl_extend('force', opts, require('lsp.tailwindcss'))
	elseif server == 'texlab' then
		opts = vim.tbl_extend('force', opts, require('lsp.texlab'))
	elseif server == 'ts_ls' then
		opts = vim.tbl_extend('force', opts, require('lsp.ts_ls'))
	elseif server == 'ruby_lsp' then
		opts = vim.tbl_extend('force', opts, {
			cmd = { vim.fn.expand('~/.rbenv/shims/ruby-lsp') },
		})
	end

	nvim_lsp.config(server, opts)
end
