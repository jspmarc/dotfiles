vim.g.vimsyn_embed = 'l'

---------------------------------------------------------------------------------------------------
-- Load Modules
---------------------------------------------------------------------------------------------------
require'settings'
require'keybinds'
require'plugins'
require'theme'
-- require'netrw'

---------------------------------------------------------------------------------------------------
-- Custom commands for different filetypes
---------------------------------------------------------------------------------------------------
vim.api.nvim_exec([[
" autocmd FileType rust setlocal expandtab
" autocmd FileType python setlocal expandtab

autocmd BufEnter *.notal setfiletype notal
autocmd BufEnter *.asm setfiletype nasm
]], false)
