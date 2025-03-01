local map = require('helpers').map

map('n', '<leader>gg', '<cmd>lua require("vscode").action("lazygit-vscode.toggle")<CR>')
