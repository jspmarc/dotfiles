local g, api = vim.g, vim.api
local map = require('helpers').map

g.fzf_layout = {
    window = {
        width = 0.8,
        height = 0.8
    }
}
api.nvim_command([[let $FZF_DEFAULT_OPTS = '--reverse']])

----- keybindings -----
map('n', '<leader>fl', ':BLines<CR>')
map('n', '<leader>fb', ':Buffers<CR>')
map('n', '<C-p>', ':Buffers<CR>')
map('n', '<leader>ff', ':Files<CR>')
map('n', '<leader>fh', ':History<CR>')
map('n', '<leader>fga', ':GFiles<CR>')
map('n', '<leader>fgs', ':GFiles?<CR>')
map('n', '<leader>fw', ':Windows<CR>')
map('n', '<leader>fr', ':Rg<CR>')
map('n', '<leader>fc', ':Colors<CR>')
