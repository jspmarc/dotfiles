local g, api = vim.g, vim.api

g.floaterm_gitcommit = 'vsplit'
g.floaterm_autoclose = 1
api.nvim_command([[command! LF FloatermNew lf]])
