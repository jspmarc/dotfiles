local nvim_lsp = require('lspconfig')
--local on_attach = require'completion'.on_attach()
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

--[[ for lua setup ]]--
local system_name
if vim.fn.has("mac") == 1 then
    system_name = "macOS"
elseif vim.fn.has("unix") == 1 then
    system_name = "Linux"
elseif vim.fn.has('win32') == 1 then
    system_name = "Windows"
else
    print("Unsupported system for sumneko")
end

local sumneko_root_path = os.getenv('HOME') .. '/sources/lua-language-server'
local sumneko_binary = sumneko_root_path.."/bin/"..system_name.."/lua-language-server"
--[[ end ]]--

nvim_lsp.clangd.setup{
    --on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        filetypes = { 'c', 'cpp', 'cc', 'hpp', 'h', 'objc', 'objcpp' },
    }
}
nvim_lsp.pyright.setup{
    --on_attach = on_attach
}
nvim_lsp.sumneko_lua.setup {
    cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"};
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT',
                -- Setup your lua path
                path = vim.split(package.path, ';'),
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = {'vim'},
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = {
                    [vim.fn.expand('$VIMRUNTIME/lua')] = true,
                    [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
                },
            },
        },
    },
    --on_attach = on_attach,
    capabilities = capabilities,
}
nvim_lsp.texlab.setup{
    --on_attach = on_attach
    capabilities = capabilities,
}
nvim_lsp.tsserver.setup{
    --on_attach = on_attach
    capabilities = capabilities,
}
nvim_lsp.vimls.setup{
    --on_attach = on_attach
    capabilities = capabilities,
}
nvim_lsp.jsonls.setup {
    commands = {
        Format = {
            function()
                vim.lsp.buf.range_formatting({},{0,0},{vim.fn.line("$"),0})
            end
        }
    },
    capabilities = capabilities,
}

----- keybindings -----
map('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>')
map('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>')
map('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>')
map('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>')
map('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
map('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>')
map('n', '<leader>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>')
map('n', '<leader>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>')

vim.lsp.set_log_level("debug")
