local map = require('helpers').map

----- keybindings -----
map('n', '<leader>gs', ':G<CR>')
map('n', '<leader>ga', ':G add --patch<CR>')
map('n', '<leader>gh', ':diffget //3<CR>')
map('n', '<leader>gf', ':diffget //2<CR>')
map('n', '<leader>gd', ':G diff<CR>')
