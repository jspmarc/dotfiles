local map = require('helpers').map

vim.g.mundo_width = 30

----- keybindings -----
map('n', '<C-z>', ':MundoToggle<CR>')
