local map = require'helpers'.map

-- auto open NERDTree when opening neovim with 0 args
vim.api.nvim_command([[autocmd StdinReadPre * let s:std_in=1]])
vim.api.nvim_command([[autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd ']])

----- keybindings -----
map('n', '<C-b>', ':NERDTreeToggle<CR>')
