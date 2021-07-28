local g = vim.g

local prettier_config = {
    exe = "prettier",
    args = {'--config ~/.config/.prettierrc.json', '--stdin-filepath %'},
    stdin = 1,
}

g.neoformat_typescript_prettier = prettier_config
g.neoformat_javascript_prettier = prettier_config

g.neoformat_enabled_javascript = { 'prettier' }
g.neoformat_enabled_typescript = { 'prettier' }

g.neoformat_try_formatprg = 1
g.neoformat_verbose = 0
