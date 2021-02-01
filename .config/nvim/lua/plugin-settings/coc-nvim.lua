-- 'signcolumn' and 'statusline' settings already set on settings.lua

-- Highlight the symbol and its references when holding the cursor.
vim.api.nvim_command([[autocmd CursorHold * silent call CocActionAsync('highlight')]])
vim.api.nvim_command([[command! -nargs=0 Prettier :CocCommand prettier.formatFile]])
