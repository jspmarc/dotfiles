local map = require('helpers').map

-- key bindings for plugins
-- sorted by plugin name and then author name

-- akinsho/bufferline.nvim
map('n', '<leader>b]', ':BufferLineCycleNext<CR>')
map('n', '<leader>b[', ':BufferLineCyclePrev<CR>')

-- glepnir/Dashboard.nvim
--[[ map('n', '<leader>ss', ':SessionSave<CR>')
map('n', '<leader>sl', ':SessionLoad<CR>') ]]
map('n', '<C-n>', ':DashboardNewFile<CR>')

-- easymotion/vim-easymotion
map('n', '<leader><leader>f', '<Plug>(easymotion-overwin-f)', { noremap = false })
map('n', '<leader><leader>w', '<Plug>(easymotion-overwin-w)', { noremap = false })
map('n', '<leader><leader>e', '<Plug>(easymotion-e)', { noremap = false })
map('n', '<leader><leader>b', '<Plug>(easymotion-b)', { noremap = false })
map('n', '<leader><leader>j', '<Plug>(easymotion-j)', { noremap = false })
map('n', '<leader><leader>k', '<Plug>(easymotion-k)', { noremap = false })

-- voldkiss/vim-floaterm
map('n', '<C-t>', ':FloatermToggle<CR>')
map('n', '<leader>ft', ':FloatermToggle<CR>')
map('n', '<leader>ftn', ':FloatermNew<CR>')
map('n', '<leader>ft[', ':FloatermPrev<CR>')
map('n', '<leader>ft]', ':FloatermNext<CR>')

-- airblade/vim-gitgutter
map('n', '<leader>gp', '<Plug>(GitGutterPreviewHunk)', { noremap = false })
map('n', '<leader>gs', '<Plug>(GitGutterStageHunk)', { noremap = false })
map('n', '<leader>gu', '<Plug>(GitGutterUndoHunk)', { noremap = false })

-- b3nj5m1n/kommentary
map('n', '<C-_>', '<Plug>kommentary_line_default', { noremap = false })
map('v', '<C-_>', '<Plug>kommentary_visual_default', { noremap = false })

-- nvim-telescope/telescope
map('n', '<leader>tc', '<cmd>lua require("telescope.builtin").colorscheme()<CR>')
map('n', '<leader>tf', '<cmd>lua require("telescope.builtin").find_files()<CR>')
map('n', '<leader>th', '<cmd>lua require("telescope.builtin").oldfiles()<CR>')
map('n', '<leader>tq', '<cmd>lua require("telescope.builtin").quickfix()<CR>')
map('n', '<leader>tw', '<cmd>lua require("telescope.builtin").live_grep()<CR>')

-- kyazdani42/nvim-tree.lua
map('n', '<C-b>', ':NvimTreeToggle<CR>')
