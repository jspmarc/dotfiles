local map = require('helpers').map

-- key bindings for plugins
-- sorted by plugin name and then author name

-- rest-nvim/rest.nvim
map('n', '<leader>rr', '<cmd>Rest run<CR>')
map('n', '<leader>re', '<cmd>lua require("telescope").extensions.rest.select_env()<CR>')
