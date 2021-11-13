local map = require'../helpers'.map

-- key bindings for plugins
-- sorted by plugin name and then author name

-- 'b3nj5m1n/kommentary'
map("n", "<C-_>", "<Plug>kommentary_line_default", {noremap = false})
map("v", "<C-_>", "<Plug>kommentary_visual_default", {noremap = false})
