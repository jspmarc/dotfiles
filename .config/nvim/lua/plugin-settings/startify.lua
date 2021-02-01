local g, api = vim.g, vim.api

g.startify_session_dir = os.getenv('HOME') .. '.vim/sessions'

-- Read ~/.NERDTreeBookmarks file and takes its second column
api.nvim_exec([[
function! s:nerdtreeBookmarks()
    let bookmarks = systemlist("cut -d' ' -f 2 ~/.NERDTreeBookmarks")
    let bookmarks = bookmarks[0:-2] " Slices an empty last line
    return map(bookmarks, "{'line': v:val, 'path': v:val}")
endfunction
]], false)

g.ascii = {
        [[      ___           ___           ___           ___                       ___     ]],
        [[     /\__\         /\  \         /\  \         /\__\          ___        /\__\    ]],
        [[    /::|  |       /::\  \       /::\  \       /:/  /         /\  \      /::|  |   ]],
        [[   /:|:|  |      /:/\:\  \     /:/\:\  \     /:/  /          \:\  \    /:|:|  |   ]],
        [[  /:/|:|  |__   /::\~\:\  \   /:/  \:\  \   /:/__/  ___      /::\__\  /:/|:|__|__ ]],
        [[ /:/ |:| /\__\ /:/\:\ \:\__\ /:/__/ \:\__\  |:|  | /\__\  __/:/\/__/ /:/ |::::\__\]],
        [[ \/__|:|/:/  / \:\~\:\ \/__/ \:\  \ /:/  /  |:|  |/:/  / /\/:/  /    \/__/~~/:/  /]],
        [[     |:/:/  /   \:\ \:\__\    \:\  /:/  /   |:|__/:/  /  \::/__/           /:/  / ]],
        [[     |::/  /     \:\ \/__/     \:\/:/  /     \::::/__/    \:\__\          /:/  /  ]],
        [[     /:/  /       \:\__\        \::/  /       ~~~~         \/__/         /:/  /   ]],
        [[     \/__/         \/__/         \/__/                                   \/__/    ]]
}

api.nvim_command([[let g:startify_custom_header = startify#center(g:ascii)]])
api.nvim_command([[let g:startify_lists = [
        \ { 'type': 'sessions',                      'header': ['   Sessions']},
        \ { 'type': function('s:nerdtreeBookmarks'), 'header': ['   NERDTree Bookmarks']},
        \ { 'type': 'files',                         'header': ['   Recent Files']},
        \ { 'type': 'dir',                           'header': ['   Files in dir']},
        \] ]])
