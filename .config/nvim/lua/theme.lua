local api, g = vim.api, vim.g

api.nvim_command([[let $NVIM_TUI_ENABLE_TRUE_COLOR=1]])

----------------------------------
------------ gruvbox -------------
----------------------------------
g.gruvbox_contrast_dark = 'medium'
g.gruvbox_hls_cursor = 'purple'
g.gruvbox_italic = 1
g.gruvbox_italicize_strings = 0
g.gruvbox_italicize_comments = 1

---------------------------------------
------------ oceanic next -------------
---------------------------------------
g.oceanic_next_terminal_bold = 1
g.oceanic_next_terminal_italic = 1

-------------------------------
------------ nord -------------
-------------------------------
g.nord_cursor_line_number_background = 1
g.nord_bold_vertical_split_line = 1
g.nord_italic = 1
g.nord_italic_comments = 1
g.nord_underline = 1

------------------------------------
------------ materials -------------
------------------------------------
g.material_theme_style = 'darker'
g.material_terminal_italics = 1

--api.nvim_exec([[
--syntax on
--syntax enable

--colorscheme gruvbox
--]])

api.nvim_command('colorscheme gruvbox')
