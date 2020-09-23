" -----------------------------------------------------------------------------
" Siginit settingns
" -----------------------------------------------------------------------------
let g:signit_initials = 'JM'
let g:signit_name = 'Josep Macello'
let g:signit_extra_1 = 'https://github.com/jspmarc'
let g:signit_extra_2 = 'https://linkedin.com/in/josepmk1'

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
