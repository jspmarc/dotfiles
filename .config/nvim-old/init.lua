vim.g.vimsyn_embed = 'l'

---------------------------------------------------------------------------------------------------
-- Load Modules
---------------------------------------------------------------------------------------------------
require'plugins'
require'keybinds'
require'settings'
-- require'netrw'
require'theme'

vim.api.nvim_exec([[
" =============================================================================
" Custom commands for different filetypes
" =============================================================================
autocmd FileType css setlocal shiftwidth=2 softtabstop=2 tabstop=2
autocmd FileType php setlocal shiftwidth=2 softtabstop=2 tabstop=2
autocmd FileType typescript setlocal shiftwidth=2 softtabstop=2 tabstop=2
autocmd FileType typescriptreact setlocal shiftwidth=2 softtabstop=2 tabstop=2
autocmd FileType javascript setlocal shiftwidth=2 softtabstop=2 tabstop=2
autocmd FileType javascriptreact setlocal shiftwidth=2 softtabstop=2 tabstop=2
autocmd FileType svelte setlocal shiftwidth=2 softtabstop=2 tabstop=2
autocmd FileType html setlocal shiftwidth=2 softtabstop=2 tabstop=2
autocmd FileType yaml setlocal shiftwidth=2 softtabstop=2 tabstop=2
autocmd FileType vue setlocal shiftwidth=2 softtabstop=2 tabstop=2
autocmd FileType tex setlocal shiftwidth=2 softtabstop=2 tabstop=2
autocmd FileType nasm setlocal noexpandtab
autocmd FileType go setlocal noexpandtab
autocmd FileType dashboard IndentLinesDisable
autocmd FileType vimwiki setlocal shiftwidth=2 softtabstop=2 tabstop=2

autocmd BufEnter *.notal setfiletype notal
autocmd BufEnter *.asm setfiletype nasm
]], false)
