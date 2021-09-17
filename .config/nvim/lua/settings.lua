-----------------------------------------------
------------ vim-related settings -------------
-----------------------------------------------
local o = vim.opt

o.background = 'dark'
o.termguicolors = true

o.expandtab = true -- use spaces instead of tabs
o.tabstop = 4 -- use 4 tabstops
o.softtabstop = 4 -- use 4 spacings
o.shiftwidth = 4 -- use 4 spacings
o.smartindent = true -- automatically indents

o.nu = true -- line number
o.rnu = true -- relative line number
o.signcolumn = 'yes:1' -- always show signcolumn

o.wrap = false -- disable line wrapping
o.linebreak = true -- nice line wrapping

-- o.scrolloff = 3 -- leaving 3 lines on the window before scrolling up/down
-- o.sidescrolloff = 5 -- same as 'scrolloff' but for horizontal scrollinig
o.colorcolumn = '100' -- draw vertical line at 100 cols
o.cursorline = false -- highlight current line

o.list = true -- ``helper'' for 'lcs'
o.lcs = [[tab:| ]] -- shows indent line when using tabs
-- vim.api.nvim_command([[set list lcs=tab:\|\ ]]) -- Shows indent line when using tab

o.ignorecase = true -- ignore case when searching
o.smartcase = true -- don't ignore case when searching capitilized character
o.incsearch = true -- start searching before done/while typing

o.backup = false -- no backup
o.writebackup = false -- no backup
o.swapfile = false -- don't use swapfiles

o.undodir = os.getenv('HOME') .. '/.vim/undodir/' -- set undo dir to ~/.vim/undodir
-- using $HOME for compat with powershell
o.undofile = true -- enable undofiles for undotree

o.foldlevelstart = 99 -- fold all folds on opening buffers
o.foldmethod = 'expr' -- treesitter
o.foldexpr = [[nvim_treesitter#foldexpr()]] -- treesitter

-- o.clipboard = vim.o.clipboard .. 'unnamedplus' -- use unnamedplus clipboard
o.clipboard = 'unnamedplus' -- use unnamedplus clipboard
o.updatetime = 1000 -- update time
o.mouse = 'nvi' -- enables mouse support for normal, visual, insert
o.hidden = true -- enable modified buffers in bakground
o.shortmess = 'flmnrwx' -- shorten messages on airline
o.autochdir = true -- autochdir on changing buffer
o.autowrite = true -- autosave on leaving nvim
o.pyxversion = 3 -- pythonx version
o.guicursor = 'c-v-r-cr:hor75,i-ci:ver75,n:block,a:blinkon0' -- nice cursors
o.completeopt = 'menuone,noinsert,noselect' -- completion box
o.omnifunc = 'v:lua.vim.lsp.omnifunc' -- nvim-lsp 'setup'
o.concealcursor = 'nc' -- conceal text settings
