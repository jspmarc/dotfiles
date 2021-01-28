local scopes = {o = vim.o, b = vim.bo, w = vim.wo}

local function set_opts(scope, key, value)
    scopes[scope][key] = value
    --if scope ~= 'o' then
        --scopes['o'][key] = value
    --end
end

----------------------------------
---------- Vim settings ----------
----------------------------------
local home = '/home/josep/'
set_opts('o', 'guicursor',
    'c-v-r-cr:hor75,i-ci:ver75,n:block,a:blinkon0') -- nice cursors
set_opts('o', 'autowrite', true) -- autosave on leaving nvim
set_opts('o', 'expandtab', true) -- use spaces instead of tabs
set_opts('o', 'smartindent', true) -- automatically indents
set_opts('o', 'ignorecase', true) -- ignore case when searching
set_opts('o', 'smartcase', true) -- don't ignore case when searching capitilized character
set_opts('o', 'incsearch', true) -- start searching before done/while typing
set_opts('o', 'swapfile', false) -- don't use swapfiles
set_opts('o', 'backup', false) -- no backup
set_opts('o', 'writebackup', false) -- no backup
set_opts('o', 'undodir', home .. '.vim/undodir/') -- set undo dir to ~/.vim/undodir
set_opts('o', 'undofile', true) -- enable undofiles for undotree
set_opts('o', 'linebreak', true) -- nice line wrapping
set_opts('o', 'scrolloff', 3)
set_opts('o', 'sidescrolloff', 5)
set_opts('o', 'background', 'dark')
set_opts('o', 'colorcolumn', '80') -- draw vertical line at 80 cols
--set_opts('o', 'clipboard', vim.o.clipboard .. 'unnamedplus') -- use unnamedplus clipboard
set_opts('o', 'clipboard', 'unnamedplus') -- use unnamedplus clipboard
set_opts('o', 'list', true) -- shows indent line when using tabs
set_opts('o', 'lcs', [[tab:\|\]]) -- shows indent line when using tabs
set_opts('o', 'updatetime', 1000) -- update time
set_opts('o', 'mouse', 'nvi') -- enables mouse support for normal, visual, insert
set_opts('o', 'wrap', false) -- disable line wrapping
set_opts('o', 'hidden', true) -- enable modified buffers in background
set_opts('o', 'shortmess', 'flmnrwx') -- shorten messages on airline
set_opts('o', 'autochdir', true) -- autochdir on changing buffer
set_opts('b', 'tabstop', 4) -- use 4 tabstops
set_opts('b', 'softtabstop', 4) -- use 4 spacings
set_opts('b', 'shiftwidth', 4) -- use 4 spacings
set_opts('w', 'nu', true) -- line number
set_opts('w', 'rnu', true) -- relative line number
