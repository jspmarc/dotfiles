" =============================================================================
" theme settings
" =============================================================================
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

if (has("termguicolors"))
    set termguicolors
endif

" -----------------------------------------------------------------------------
" For gruvbox
" -----------------------------------------------------------------------------
let g:gruvbox_contrast_dark = 'medium'
let g:gruvbox_hls_cursor = 'purple'
let g:gruvbox_italic = 1
let g:gruvbox_italicize_strings =  0
let g:gruvbox_italicize_comments = 1

" -----------------------------------------------------------------------------
" Oceanic next
" -----------------------------------------------------------------------------
let g:oceanic_next_terminal_bold = 1
let g:oceanic_next_terminal_italic = 1

" -----------------------------------------------------------------------------
" for nord
" -----------------------------------------------------------------------------
let g:nord_cursor_line_number_background = 1
let g:nord_bold_vertical_split_line = 1
let g:nord_italic = 1
let g:nord_italic_comments = 1
let g:nord_underline = 1

" ----------------------------------------------------------------------------
" for material
" -----------------------------------------------------------------------------
let g:material_theme_style = 'darker'
let g:material_terminal_italics = 1

syntax on
syntax enable

colorscheme gruvbox
