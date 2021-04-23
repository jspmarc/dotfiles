local nvim_lsp = require('lspconfig')
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
    capabilities = capabilities,
    settings = {
        filetypes = { 'c', 'cpp', 'cc', 'hpp', 'h', 'objc', 'objcpp' },
    }
}

-- nvim_lsp.pyright.setup{
--     capabilities = capabilities,
-- }

nvim_lsp.pyls.setup{
    capabilities = capabilities,
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
    capabilities = capabilities,
}

nvim_lsp.texlab.setup{
    capabilities = capabilities,
}

--nvim_lsp.denols.setup{
    --capabilities = capabilities,
--}

nvim_lsp.tsserver.setup{
    capabilities = capabilities,
}

nvim_lsp.vimls.setup{
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

nvim_lsp.jdtls.setup {
    cmd = {
        '/usr/lib/jvm/default-runtime/bin/java',
        '-Declipse.application=org.eclipse.jdt.ls.core.id1',
        '-Dosgi.bundles.defaultStartLevel=4',
        '-Declipse.product=org.eclipse.jdt.ls.core.product',
        '-Dlog.protocol=true',
        '-Dlog.level=ALL',
        '-Xms1g',
        '-Xmx2G',
        '-jar',
        os.getenv('HOME') .. '/sources/jdtls/plugins/org.eclipse.equinox.launcher_1.6.100.v20201223-0822.jar',
        '-configuration',
        os.getenv('HOME') .. '/sources/jdtls/config_linux',
        '-data',
        os.getenv('HOME') .. '/.gradle',
        '--add-modules=ALL-SYSTEM',
        '--add-opens java.base/java.util=ALL-UNNAMED',
        '--add-opens java.base/java.lang=ALL-UNNAMED',
    },
    cmd_env = {
        GRADLE_HOME = os.getenv('HOME') .. '/.gradle',
        JAR = os.getenv('HOME') .. '/sources/jdtls/plugins/org.eclipse.equinox.launcher_1.6.100.v20201223-0822.jar',
        JAVA_HOME = '/usr/lib/jvm/default-runtime',
        JDTLS_CONFIG = os.getenv('HOME') .. '/sources/jdtls/config_linux',
    },
    capabilities = capabilities,
}

nvim_lsp.svelte.setup {
    capabilities = capabilities,
}

nvim_lsp.rust_analyzer.setup {
    capabilities = capabilities,
}

nvim_lsp.gopls.setup {
    capabilities = capabilities,
    --cmd = { "gopls", "serve" },
    settings = {
        gopls = {
            analyses = {
                unusedparams = true,
            },
            staticcheck = true,
        },
    },
}

nvim_lsp.dockerls.setup{
    capabilities = capabilities,
}

nvim_lsp.html.setup {
    capabilities = capabilities
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
