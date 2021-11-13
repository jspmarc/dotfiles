" -----------------------------------------------------------------------------
" Startify
" -----------------------------------------------------------------------------
let g:startify_session_dir = "~/.vim/sessions/"
" Read ~/.NERDTreeBookmarks file and takes its second column
function! s:nerdtreeBookmarks()
    let bookmarks = systemlist("cut -d' ' -f 2 ~/.NERDTreeBookmarks")
    let bookmarks = bookmarks[0:-2] " Slices an empty last line
    return map(bookmarks, "{'line': v:val, 'path': v:val}")
endfunction

let g:ascii = [
        \ '      ___           ___           ___           ___                       ___     ',
        \ '     /\__\         /\  \         /\  \         /\__\          ___        /\__\    ',
        \ '    /::|  |       /::\  \       /::\  \       /:/  /         /\  \      /::|  |   ',
        \ '   /:|:|  |      /:/\:\  \     /:/\:\  \     /:/  /          \:\  \    /:|:|  |   ',
        \ '  /:/|:|  |__   /::\~\:\  \   /:/  \:\  \   /:/__/  ___      /::\__\  /:/|:|__|__ ',
        \ ' /:/ |:| /\__\ /:/\:\ \:\__\ /:/__/ \:\__\  |:|  | /\__\  __/:/\/__/ /:/ |::::\__\',
        \ ' \/__|:|/:/  / \:\~\:\ \/__/ \:\  \ /:/  /  |:|  |/:/  / /\/:/  /    \/__/~~/:/  /',
        \ '     |:/:/  /   \:\ \:\__\    \:\  /:/  /   |:|__/:/  /  \::/__/           /:/  / ',
        \ '     |::/  /     \:\ \/__/     \:\/:/  /     \::::/__/    \:\__\          /:/  /  ',
        \ '     /:/  /       \:\__\        \::/  /       ~~~~         \/__/         /:/  /   ',
        \ '     \/__/         \/__/         \/__/                                   \/__/    ',
        \ ]

let g:startify_custom_header = startify#center(g:ascii)

let g:startify_lists = [
        \ { 'type': 'sessions',                      'header': ['   Sessions']},
        \ { 'type': function('s:nerdtreeBookmarks'), 'header': ['   NERDTree Bookmarks']},
        \ { 'type': 'files',                         'header': ['   Recent Files']},
        \ { 'type': 'dir',                           'header': ['   Files in dir']},
        \]
