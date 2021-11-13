local map = require'helpers'.map

require('kommentary.config').use_extended_mappings()
require('kommentary.config').configure_language("default", {
    prefer_single_line_comments = true,
    ignore_whitespace = true,
})

----- keybindings -----
map("n", "<C-_>", "<Plug>kommentary_line_default", {noremap = false})
map("v", "<C-_>", "<Plug>kommentary_visual_default", {noremap = false})
