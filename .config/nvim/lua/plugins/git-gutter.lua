local map = require('helpers').map

----- keybindings -----
map('n', '<leader>g]', ':GitGutterNextHunk<CR>')
map('n', '<leader>g[', ':GitGutterPrevHunk<CR>')
map('n', '<leader>gp', ':GitGutterPreviewHunk<CR>')
map('n', '<leader>gg', ':GitGutterStageHunk<CR>')
map('n', '<leader>gu', ':GitGutterUndoHunk<CR>')
