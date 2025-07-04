local helpers = require('helpers')

vim.g.vimsyn_embed = 'l'
vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

-- vim.g.codecompanion_auto_tool_mode = 1
vim.g.lumen_light_colorscheme = helpers.themes.light
vim.g.lumen_dark_colorscheme = helpers.themes.dark
vim.g['sneak#label'] = 1
vim.g.tmux_navigator_no_mappings = 1

-- *** options ***
local o = vim.opt

-- o.autochdir = true -- change dir on changing buffer
o.autowrite = true -- save file on leaving nvim

o.backup = false
o.background = 'dark'

o.cursorline = true -- disable highlight current line
o.clipboard = 'unnamedplus'
o.colorcolumn = '80,100,120' -- draw a vertical line at 80 col
o.concealcursor = 'c' -- conceal text settings
o.conceallevel = 2 -- conceal text settings

o.expandtab = false -- use tabs
o.endofline = true
o.exrc = true

o.fixendofline = true
o.foldlevelstart = 99 -- fold all folds on opening buffers
o.foldmethod = 'expr' -- treesitter
o.foldexpr = 'v:lua.vim.treesitter.foldexpr()' -- treesitter

o.guicursor = 'c-v-r-cr:hor75,i-ci:ver75,n:block,a:blinkon0' -- nice cursors

o.hidden = true -- enable modified buffers stay in the backkground

o.incsearch = true
o.ignorecase = true

o.laststatus = 3
o.linebreak = true -- nice line breaks
o.list = true -- show indentation
o.lcs = [[tab:| ]] -- custom indentation for tabs

o.nu = true

o.mouse = 'nvi' -- enables mouse on 'normal, visual, insert' mode

o.pyxversion = 3 -- pythonx version

o.rnu = true

o.scrolloff = 3 -- leaving 3 lines on the window before scrolling up/down
o.shiftwidth = 4
-- o.shortmess = 'flmnrwx' -- shorten messages for vim airline
o.sidescrolloff = 5 -- same as 'scrolloff' but for horizontal scrolling
o.signcolumn = 'yes:1' -- always show signcolumn
o.smartcase = true
o.smartindent = true
o.softtabstop = 4 -- for tabs with spaces
o.swapfile = false

o.tabstop = 4
o.termguicolors = true

o.undodir = os.getenv('HOME') .. '/.local/share/nvim/pack' -- set undo files directory to ~/.vim/undodir
o.undofile = true -- enable undofiles
o.updatetime = 1000

o.wrap = false -- disables linewrapping
o.writebackup = false

-- *** neovide ***
if not helpers.not_neovide then
	if helpers.is_mac then
		o.guifont = 'JetBrainsMono Nerd Font Propo:h13'
	else
		o.guifont = 'JetBrainsMono Nerd Font Propo:h11'
	end
	vim.g.neovide_confirm_quit = true
	vim.g.neovide_detach_on_quit = 'always_detach'
	vim.g.neovide_input_macos_option_key_is_meta = 'both'
end
