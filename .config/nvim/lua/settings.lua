-----------------------------------------------
------------ vim-related settings -------------
-----------------------------------------------

local set_opt = vim.api.nvim_set_option
local set_buf_opt = vim.api.nvim_buf_set_option
local set_win_opt = vim.api.nvim_win_set_option

set_opt('background', 'dark')
set_opt('termguicolors', true)

set_buf_opt(0, 'expandtab', true) -- use spaces instead of tabs
set_buf_opt(0, 'tabstop', 4) -- use 4 tabstops
set_buf_opt(0, 'softtabstop', 4) -- use 4 spacings
set_buf_opt(0, 'shiftwidth', 4) -- use 4 spacings
set_buf_opt(0, 'smartindent', true) -- automatically indents

set_win_opt(0, 'nu', true) -- line number
set_win_opt(0, 'rnu', true) -- relative line number
set_win_opt(0, 'signcolumn', 'yes:1') -- always show signcolumn

set_win_opt(0, 'wrap', false) -- disable line wrapping
set_win_opt(0, 'linebreak', true) -- nice line wrapping

-- set_opt('scrolloff', 3) -- leaving 3 lines on the window before scrolling up/down
-- set_opt('sidescrolloff', 5) -- same as 'scrolloff' but for horizontal scrollinig
set_win_opt(0, 'colorcolumn', '100') -- draw vertical line at 100 cols
set_win_opt(0, 'cursorline', false) -- highlight current line

set_win_opt(0, 'list', true) -- ``helper'' for 'lcs'
set_opt('lcs', [[tab:| ]]) -- shows indent line when using tabs
-- vim.api.nvim_command([[set list lcs=tab:\|\ ]]) -- Shows indent line when using tab

set_opt('ignorecase', true) -- ignore case when searching
set_opt('smartcase', true) -- don't ignore case when searching capitilized character
set_opt('incsearch', true) -- start searching before done/while typing

set_opt('backup', false) -- no backup
set_opt('writebackup', false) -- no backup
set_buf_opt(0, 'swapfile', false) -- don't use swapfiles

set_opt('undodir', os.getenv('HOME') .. '/.vim/undodir/') -- set undo dir to ~/.vim/undodir
                                                                -- using $HOME for compat with powershell
set_buf_opt(0, 'undofile', true) -- enable undofiles for undotree

set_opt('foldlevelstart', 99) -- fold all folds on opening buffers
set_win_opt(0, 'foldmethod', 'expr') -- treesitter
set_win_opt(0, 'foldexpr', [[nvim_treesitter#foldexpr()]]) -- treesitter

-- set_opt('clipboard', vim.o.clipboard .. 'unnamedplus') -- use unnamedplus clipboard
set_opt('clipboard', 'unnamedplus') -- use unnamedplus clipboard
set_opt('updatetime', 1000) -- update time
set_opt('mouse', 'nvi') -- enables mouse support for normal, visual, insert
set_opt('hidden', true) -- enable modified buffers in bakground
set_opt('shortmess', 'flmnrwx') -- shorten messages on airline
set_opt('autochdir', true) -- autochdir on changing buffer
set_opt('autowrite', true) -- autosave on leaving nvim
set_opt('pyxversion', 3) -- pythonx version
set_opt('guicursor', 'c-v-r-cr:hor75,i-ci:ver75,n:block,a:blinkon0') -- nice cursors
set_opt('completeopt', 'menuone,noinsert,noselect') -- completion box
set_buf_opt(0, 'omnifunc', 'v:lua.vim.lsp.omnifunc') -- nvim-lsp 'setup'
set_win_opt(0, 'concealcursor', 'nc') -- conceal text settings
