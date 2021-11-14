local installer = require'nvim-lsp-installer'
local util = require'lspconfig.util'
local capabilities = require'cmp_nvim_lsp'.update_capabilities(vim.lsp.protocol.make_client_capabilities())

installer.on_server_ready(function(server)
	local opts = {
		capabilities = capabilities
	}

	if server.name == 'sumneko_lua' then
		opts = vim.tbl_extend('force', opts, require'lsp.lua')
	elseif server.name == 'dockerls' then
		opts = vim.tbl_extend('force', opts, {
			filetypes = { 'dockerfile', 'Dockerfile' },
			root_dir = util.root_pattern('dockerfile', 'Dockerfile')
		})
	elseif server.name == 'efm' then
		opts = vim.tbl_extend('force', opts, require'lsp.efm')
	end

	server:setup(opts)
end)

