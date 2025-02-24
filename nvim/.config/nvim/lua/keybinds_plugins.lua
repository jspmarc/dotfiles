local map = require('helpers').map

-- key bindings for plugins
-- sorted by plugin name and then author name

-- nvim-telescope/telescope
map('n', '<leader>tb', '<cmd>lua require("telescope.builtin").buffers()<CR>')
map('n', '<leader>tf', '<cmd>Telescope find_files<CR>')
map('n', '<leader>tF', '<cmd>Telescope find_files hidden=true no_ignore=true<CR>')
map('n', '<leader>th', '<cmd>lua require("telescope.builtin").oldfiles()<CR>')
map('n', '<leader>to', '<cmd>TodoTelescope<CR>')
map('n', '<leader>tq', '<cmd>lua require("telescope.builtin").quickfix()<CR>')
map('n', '<leader>ts', '<cmd>Telescope smart_open<CR>')
map('n', '<leader>tw', '<cmd>lua require("telescope.builtin").live_grep()<CR>')

-- folke/trouble.nvim
map('n', '<leader>xa', '<cmd>Trouble diagnostics toggle<CR>')
map('n', '<leader>xd', '<cmd>Trouble diagnostics toggle filter.buf=0<CR>')
map('n', '<leader>xo', '<cmd>TodoTrouble<CR>')
map('n', '<leader>xx', '<cmd>Trouble close<CR>')

-- rest-nvim/rest.nvim
map('n', '<leader>rr', '<cmd>Rest run<CR>')
map('n', '<leader>re', '<cmd>lua require("telescope").extensions.rest.select_env()<CR>')
