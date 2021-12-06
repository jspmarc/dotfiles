" -----------------------------------------------------------------------------
" Airline theme and customization
" -----------------------------------------------------------------------------
let g:airline_theme='gruvbox'
let g:airline_powerline_fonts = 0

"let g:airline_left_sep = "\uE0B8"
"let g:airline_right_sep = "\uE0BA"
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline_section_c = '%t%m%r'
"let g:airline_section_z = "\uE0A1 %l/%L \uE0B3 %P \uE0B3 \uE0A3 %c"
let g:airline_section_z = "\uE0A1 %l/%L \uE0B3 \uE0A3 %c"

