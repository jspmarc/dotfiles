---------------------------------------------
------------ vim netrw settings -------------
---------------------------------------------
local g = vim.g

g.netrw_keepdir = 0
g.netrw_winsize = 20
g.netrw_banner = 0
g.netrw_localcopydircmd = 'cp -r'

----- keybindings -----
map('n', '<C-b>', ':Lexplore<CR>')
