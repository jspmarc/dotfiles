local map = require'helpers'.map

require'telescope'.setup {
    extensions = {
        fzf = {
            fuzzy = true,
            override_generic_sorter = false,
            override_file_sorter = true,
            case_mode = 'smart_csae'
        }
    }
}

map('n', '<leader>ff', '<cmd>lua require("telescope.builtin").find_files()<cr>')
map('n', '<leader>fg', '<cmd>lua require("telescope.builtin").live_grep()<cr>')
map('n', '<leader>fp', '<cmd>lua require("telescope.builtin").buffers()<cr>')
map('n', '<leader>fv', '<cmd>lua require("telescope.builtin").buffers.marks()<cr>')
map('n', '<leader>fh', '<cmd>lua require("telescope.builtin").oldfiles()<cr>')
map('n', '<leader>fc', '<cmd>lua require("telescope.builtin").colorscheme()<cr>')
map('n', '<leader>fr', '<cmd>lua require("telescope.builtin").registers()<cr>')
map('n', '<C-p>', '<cmd>lua require("telescope.builtin").buffers()<cr>')
-- LSP
-- map('n', '<leader>e', '<cmd>lua require("telescope.builtin").lsp_document_diagnositcs()<cr>')
-- map('n', '<leader>E', '<cmd>lua require("telescope.builtin").lsp_workspace_diagnositcs()<cr>')
-- map('n', '<leader>E', '<cmd>lua require("telescope.builtin").lsp_workspace_diagnositcs()<cr>')
-- map('n', 'gi', '<cmd>lua require("telescope.builtin").lsp_implementations()<cr>')
-- map('n', 'gd', '<cmd>lua require("telescope.builtin").lsp_definitions()<cr>')
-- map('n', 'ca', '<cmd>lua require("telescope.builtin").lsp_code_actions()<cr>')
-- map('v', 'ca', '<cmd>lua require("telescope.builtin").lsp_range_code_actions()<cr>')
