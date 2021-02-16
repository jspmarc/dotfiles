local g, api = vim.g, vim.api

g.floaterm_gitcommit = 'vsplit'
g.floaterm_autoclose = 1
api.nvim_command([[command! LF FloatermNew lf]])

----- keybindings -----
map('n', '<leader>tn', ':FloatermNew<CR>', {noremap = false})
map('n', '<leader>tc', ':FloatermKill<CR>', {noremap = false})
map('n', '<leader>tt', ':FloatermToggle<CR>', {noremap = false})
map('n', [[<leader>t[]], ':FloatermPrev<CR>', {noremap = false})
map('n', '<leader>t]', ':FloatermNext<CR>', {noremap = false})
map('n', '<leader>t{', ':FloatermFirst<CR>', {noremap = false})
map('n', '<leader>t}', ':FloatermLast<CR>', {noremap = false})
--map('n', '<leader>tl', ':CocList floaterm<CR>', {noremap = false})
--map('n', '<C-b>', ':LF<CR>')

map('t', '<leader>tn', '<C-\\><C-n>:FloatermNew<CR>', {noremap = false})
map('t', '<leader>tc', '<C-\\><C-n>:FloatermKill<CR>', {noremap = false})
map('t', '<leader>tt', '<C-\\><C-n>:FloatermToggle<CR>', {noremap = false})
map('t', [[<leader>t[]], '<C-\\><C-n>:FloatermPrev<CR>', {noremap = false})
map('t', '<leader>t]', '<C-\\><C-n>:FloatermNext<CR>', {noremap = false})
map('t', '<leader>t{', '<C-\\><C-n>:FloatermFirst<CR>', {noremap = false})
map('t', '<leader>t}', '<C-\\><C-n>:FloatermLast<CR>', {noremap = false})
--map('t', '<leader>tl', '<C-\><C-n>:CocList floaterm<CR>', {noremap = false})
