local map = require('helpers').map

-- key bindings for plugins
-- sorted by plugin name and then author name

-- akinsho/bufferline.nvim
map('n', '<A-]>', '<cmd>BufferLineCycleNext<CR>')
map('n', '<A-[>', '<cmd>BufferLineCyclePrev<CR>')

-- glepnir/Dashboard.nvim
map('n', '<C-n>', '<cmd>DashboardNewFile<CR>')

-- easymotion/vim-easymotion
map('n', '<leader><leader>f', '<Plug>(easymotion-overwin-f)', { noremap = false })
map('n', '<leader><leader>w', '<Plug>(easymotion-overwin-w)', { noremap = false })
map('n', '<leader><leader>e', '<Plug>(easymotion-e)', { noremap = false })
map('n', '<leader><leader>b', '<Plug>(easymotion-b)', { noremap = false })
map('n', '<leader><leader>j', '<Plug>(easymotion-j)', { noremap = false })
map('n', '<leader><leader>k', '<Plug>(easymotion-k)', { noremap = false })

-- lewis6991/gitsigns.nvim
map('n', '<leader>gp', '<cmd>lua require"gitsigns".preview_hunk()<CR>', { noremap = false })
map('n', '<leader>gs', '<cmd>lua require"gitsigns".stage_hunk()<CR>', { noremap = false })
map('n', '<leader>g]', '<cmd>lua require"gitsigns".next_hunk()<CR>', { noremap = false })
map('n', '<leader>g[', '<cmd>lua require"gitsigns".prev_hunk()<CR>', { noremap = false })
map(
	'v',
	'<leader>gs',
	'<cmd>lua require"gitsigns".stage_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>',
	{ noremap = false }
)
map('n', '<leader>gu', '<cmd>lua require"gitsigns".reset_hunk()<CR>', { noremap = false })
map(
	'v',
	'<leader>gu',
	'<cmd>lua require"gitsigns".reset_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>)',
	{ noremap = false }
)
map('v', '<leader>gU', '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>', { noremap = false })
map('n', '<leader>gb', '<cmd>lua require"gitsigns".blame_line{full=true}<CR>', { noremap = false })

-- b3nj5m1n/kommentary
map('n', '<C-_>', '<Plug>kommentary_line_default', { noremap = false })
map('v', '<C-_>', '<Plug>kommentary_visual_default', { noremap = false })

-- jbyuki/nabla.nvim
map('n', '<leader>p', ':lua require("nabla").popup({ border="rounded" })<CR>')

-- danymat/neogen
map('n', '<leader>d', ':Neogen<CR>')

-- nvim-telescope/telescope
map('n', '<leader>tb', '<cmd>lua require("telescope.builtin").buffers()<CR>')
map('n', '<leader>tc', '<cmd>lua require("telescope.builtin").colorscheme()<CR>')
map('n', '<leader>tf', '<cmd>Telescope find_files hidden=true no_ignore=true<CR>')
map('n', '<leader>th', '<cmd>lua require("telescope.builtin").oldfiles()<CR>')
map('n', '<leader>to', '<cmd>TodoTelescope<CR>')
map('n', '<leader>tq', '<cmd>lua require("telescope.builtin").quickfix()<CR>')
map('n', '<leader>tw', '<cmd>lua require("telescope.builtin").live_grep()<CR>')

-- kyazdani42/nvim-tree.lua
map('n', '<C-b>', '<cmd>NvimTreeToggle<CR>')

-- folke/trouble.nvim
map('n', 'xa', '<cmd>TroubleToggle workspace_diagnostics<CR>')
map('n', 'xd', '<cmd>TroubleToggle document_diagnostics<CR>')
map('n', 'xo', '<cmd>TodoTrouble<CR>')
map('n', 'xr', '<cmd>TroubleRefresh<CR>')
map('n', 'xx', '<cmd>TroubleToggle<CR>')
