local scopes = {o = vim.o, b = vim.bo, w = vim.wo}
local api = vim.api

local function set_opts(scope, key, value)
    scopes[scope][key] = value
    if scope ~= 'o' then -- some buffer option actually need to be set globally
                         -- too, might as well do the same for window options
        scopes['o'][key] = value
    end
end

set_opts('o', 'background', 'dark')
set_opts('o', 'termguicolors', true)

set_opts('b', 'expandtab', true) -- use spaces instead of tabs
set_opts('b', 'smartindent', true) -- automatically indents
set_opts('b', 'tabstop', 4) -- use 4 tabstops
set_opts('b', 'softtabstop', 4) -- use 4 spacings
set_opts('b', 'shiftwidth', 4) -- use 4 spacings

set_opts('w', 'nu', true) -- line number
set_opts('w', 'rnu', true) -- relative line number

set_opts('w', 'wrap', false) -- disable line wrapping
set_opts('w', 'linebreak', true) -- nice line wrapping

set_opts('o', 'scrolloff', 3) -- leaving 3 lines on the window before scrolling up/down
set_opts('o', 'sidescrolloff', 5) -- same as 'scrolloff' but for horizontal scrollinig
set_opts('w', 'colorcolumn', '80') -- draw vertical line at 80 cols

--set_opts('w', 'list', true) -- ``helper'' for 'lcs'
--set_opts('o', 'lcs', [[tab:\|\ ]]) -- shows indent line when using tabs
api.nvim_command([[set list lcs=tab:\|\  " Shows indent line when using tab]])

set_opts('o', 'ignorecase', true) -- ignore case when searching
set_opts('o', 'smartcase', true) -- don't ignore case when searching capitilized character
set_opts('o', 'incsearch', true) -- start searching before done/while typing

set_opts('o', 'backup', false) -- no backup
set_opts('o', 'writebackup', false) -- no backup
set_opts('b', 'swapfile', false) -- don't use swapfiles

set_opts('o', 'undodir', os.getenv('HOME') .. '/.vim/undodir/') -- set undo dir to ~/.vim/undodir
set_opts('b', 'undofile', true) -- enable undofiles for undotree

set_opts('o', 'foldlevelstart', 0) -- fold all folds on opening buffers
set_opts('w', 'foldmethod', 'expr') -- treesitter
set_opts('w', 'foldexpr', [[nvim_treesitter#foldexpr()]]) -- treesitter

set_opts('o', 'clipboard', vim.o.clipboard .. 'unnamedplus') -- use unnamedplus clipboard
set_opts('o', 'updatetime', 1000) -- update time
set_opts('o', 'mouse', 'nvi') -- enables mouse support for normal, visual, insert
set_opts('o', 'hidden', true) -- enable modified buffers in background
set_opts('o', 'shortmess', 'flmnrwx') -- shorten messages on airline
set_opts('o', 'autochdir', true) -- autochdir on changing buffer
set_opts('o', 'autowrite', true) -- autosave on leaving nvim
set_opts('o', 'pyxversion', 3) -- pythonx version
set_opts('o', 'guicursor',
    'c-v-r-cr:hor75,i-ci:ver75,n:block,a:blinkon0') -- nice cursors
