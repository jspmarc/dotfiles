local trouble = require'trouble'
local map = require'helpers'.map

trouble.setup{}

map('n', '<leader>e', ':LspTroubleToggle<cr>')
