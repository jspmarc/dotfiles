local installer = require('nvim-lsp-installer')
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

installer.on_server_ready(function(server)
	local opts = {
		capabilities = capabilities
	}

	if server.name == 'sumneko_lua' then
		opts = vim.tbl_extend('force', opts, require'lsp.lua')
	end

	server:setup(opts)
end)

