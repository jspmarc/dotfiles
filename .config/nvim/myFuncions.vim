" =============================================================================
" Custom functions
" =============================================================================
" CompileFile(): A custom function that will compile the file in question
" using a bash script
function! CompileFile()
    "cd %:p:h " Not needed since using 'set autochdir'
    execute '!compile %'
    "cd - " Not needed since using 'set autochdir'
endfunction

" RunFile(): A custom function that will run a file after it is compiled. E.g:
" Opens Zathura after compiling markdown to pdf
function! RunFile()
    " Removes the file extension
    let filename = substitute(g:filename, '\..*', '', '')
    let run = ''

    if expand('%:e') == 'md'
        let filename = filename.'.pdf'
        "let fpath = g:fpath.filename " Not needed since using 'set autochdir'
        let fpath = filename
        let run = '!zathura '.fpath
    endif
    
    execute run
endfunction
