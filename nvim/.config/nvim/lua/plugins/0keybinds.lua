local map = require('helpers').map

-- key bindings for plugins
-- sorted by plugin name and then author name

-- akinsho/bufferline.nvim
map('n', '<A-]>', '<cmd>BufferLineCycleNext<CR>')
map('n', '<A-[>', '<cmd>BufferLineCyclePrev<CR>')

-- easymotion/vim-easymotion
map('n', '<leader><leader>f', '<Plug>(easymotion-overwin-f)', { noremap = false })
map('n', '<leader><leader>w', '<Plug>(easymotion-overwin-w)', { noremap = false })
map('n', '<leader><leader>e', '<Plug>(easymotion-e)', { noremap = false })
map('n', '<leader><leader>b', '<Plug>(easymotion-b)', { noremap = false })
map('n', '<leader><leader>j', '<Plug>(easymotion-j)', { noremap = false })
map('n', '<leader><leader>k', '<Plug>(easymotion-k)', { noremap = false })

-- lewis6991/gitsigns.nvim
map('n', '<leader>gh', '<cmd>lua require"gitsigns".preview_hunk()<CR>', { noremap = false })
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
map('n', '<leader>gU', '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>', { noremap = false })
map('v', '<leader>gU', '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>', { noremap = false })
map('n', '<leader>gb', '<cmd>lua require"gitsigns".blame_line{full=true}<CR>', { noremap = false })

-- NeogitOrg/neogit
map('n', '<leader>gg', ':Neogit kind=split_above<CR>')
map('n', '<leader>gB', ':G blame<CR>')
map('n', '<leader>gp', ':Neogit push<CR>')
map('n', '<leader>gc', ':Neogit commit<CR>')
map('n', '<leader>gl', ':Neogit pull<CR>')

-- sindrets/diffview.nvim
map('n', '<leader>gdd', ':DiffviewOpen<CR>')
map('n', '<leader>gdf', ':DiffviewFileHistory %<CR>')
map('n', '<leader>gdg', ':DiffviewFileHistory<CR>')
map('n', '<leader>gdc', ':DiffviewClose<CR>')

-- b3nj5m1n/kommentary
map('n', '<C-_>', '<Plug>kommentary_line_default', { noremap = false })
map('v', '<C-_>', '<Plug>kommentary_visual_default', { noremap = false })

-- jbyuki/nabla.nvim
map('n', '<leader>p', ':lua require("nabla").popup({ border="rounded" })<CR>')

-- danymat/neogen
map('n', '<leader>d', ':Neogen<CR>')

-- stevearc/oil.nvim
map('n', '<C-b>', '<cmd>Oil<CR>')

-- nvim-telescope/telescope
map('n', '<leader>tb', '<cmd>lua require("telescope.builtin").buffers()<CR>')
map('n', '<leader>tf', '<cmd>Telescope find_files<CR>')
map('n', '<leader>tF', '<cmd>Telescope find_files hidden=true no_ignore=true<CR>')
map('n', '<leader>th', '<cmd>lua require("telescope.builtin").oldfiles()<CR>')
map('n', '<leader>to', '<cmd>TodoTelescope<CR>')
map('n', '<leader>tq', '<cmd>lua require("telescope.builtin").quickfix()<CR>')
map('n', '<leader>tw', '<cmd>lua require("telescope.builtin").live_grep()<CR>')
-- map('n', '<leader>gb', '<cmd>lua require("telescope.builtin").git_branches()<CR>')

-- kyazdani42/nvim-tree.lua
-- map('n', '<C-b>', '<cmd>NvimTreeToggle<CR>')

-- folke/trouble.nvim
map('n', '<leader>xa', '<cmd>Trouble diagnostics toggle<CR>')
map('n', '<leader>xd', '<cmd>Trouble diagnostics toggle filter.buf=0<CR>')
map('n', '<leader>xo', '<cmd>TodoTrouble<CR>')
map('n', '<leader>xr', '<cmd>TroubleRefresh<CR>')
map('n', '<leader>xx', '<cmd>TroubleToggle<CR>')

-- ThePrimeagen/refactoring.nvim
-- Note that not all refactor support both normal and visual mode
vim.keymap.set({ 'n', 'x' }, '<leader>la', function()
	require('refactoring').select_refactor()
end)

-- rest-nvim/rest.nvim
map('n', '<leader>rr', '<cmd>Rest run<CR>')
map('n', '<leader>re', '<cmd>lua require("telescope").extensions.rest.select_env()<CR>')
