vim.g.vimspector_enable_mappings = 'VISUAL_STUDIO'

----- keybindings -----
map('n','<leader>drd', ':call vimspector#Launch()<CR>')
map('n','<leader>dl', '<Plug>VimspectorStepInto', {noremap = false})
map('n','<leader>dj', '<Plug>VimspectorStepOver', {noremap = false})
map('n','<leader>dk', '<Plug>VimspectorStepOut', {noremap = false})
map('n','<leader>d0', '<Plug>VimspectorRestart', {noremap = false})
map('n','<leader>dc', ':call vimspector#Continue()<CR>')
map('n', '<leader>drc', '<Plug>VimspectorRunToCursor', {noremap = false})
map('n', '<leader>dbb', '<Plug>VimspectorToggleBreakpoint', {noremap = false})
map('n', '<leader>dbc', '<Plug>VimspectorToggleConditionalBreakpoint', {noremap = false})
map('n', '<leader>de', ':VimspectorReset<CR>', {noremap = false})
