local nvim_lsp = require('lspconfig')

nvim_lsp.vimls.setup{on_attach=require'completion'.on_attach}
nvim_lsp.texlab.setup{on_attach=require'completion'.on_attach}
