local map = require('helpers').map

map('n', 'ge', '<cmd>lua vim.diagnostic.open_float()<CR>')
map('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>')
map('n', 'gd', '<cmd>Telescope lsp_definitions<CR>')
map('n', 'gh', '<cmd>lua vim.lsp.buf.hover()<CR>')
map('n', 'gi', '<cmd>Telescope lsp_implementations<CR>')
map('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>')
map('n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>')
map('n', '<leader>wd', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>')
map('n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>')
map('n', 'gr', '<cmd>Telescope lsp_references<CR>')
-- map('n', '<leader>la', '<cmd>lua vim.lsp.buf.code_action()<CR>')
-- map('v', '<leader>la', '<cmd>lua vim.lsp.buf.code_action()<CR>')
map('n', '<leader>ld', '<cmd>TroubleToggle document_diagnostics<CR>')
map('n', '<leader>lD', '<cmd>TroubleToggle workspace_diagnostics<CR>')
map('n', '<leader>lf', '<cmd>lua vim.lsp.buf.format({ async = true })<CR>')
map('n', '<leader>lp', '<cmd>lua vim.diagnostic.open_float()<CR>')
map('n', '<leader>lq', '<cmd>lua vim.diagnostic.setloclist()<CR>')
map('n', '<leader>lr', '<cmd>lua vim.lsp.buf.rename()<CR>')
map('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<CR>')
