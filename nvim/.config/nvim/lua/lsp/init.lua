local util = require('lspconfig.util')
local capabilities = require('cmp_nvim_lsp').default_capabilities()

capabilities.textDocument.codeLens = {
	dynamicRegistration = false,
}

local servers = require('helpers').lsp_servers
vim.lsp.enable(servers)

local codelens_augroup = vim.api.nvim_create_augroup('UserLspCodeLens', { clear = true })

vim.api.nvim_create_autocmd('LspAttach', {
	group = codelens_augroup,
	callback = function(args)
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		if client and client:supports_method('textDocument/codeLens') then
			vim.lsp.codelens.enable(true, { bufnr = args.buf })
			vim.lsp.codelens.refresh({ bufnr = args.buf })
		end
	end,
})

vim.api.nvim_create_autocmd({ 'BufEnter', 'InsertLeave' }, {
	group = codelens_augroup,
	callback = function(args)
		if #vim.lsp.get_clients({ bufnr = args.buf, method = 'textDocument/codeLens' }) > 0 then
			vim.lsp.codelens.refresh({ bufnr = args.buf })
		end
	end,
})

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
	elseif server == 'gopls' then
		opts = vim.tbl_extend('force', opts, require('lsp.gopls'))
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

	vim.lsp.config(server, opts)
end
