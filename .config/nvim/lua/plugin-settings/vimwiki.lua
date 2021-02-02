local g, api = vim.g, vim.api

g.vimwiki_global_ext = 0
g.vimwiki_folding = 'list'
g.vimwiki_hl_headers = 1
g.vimwiki_html_header_numbering = 2
g.vimwiki_list = {
    {path = '~/vimwiki-notes/', syntax = 'markdown', ext = '.md'}
}
api.nvim_exec([[
" let g:vimwiki_list = [{'path': '~/vimwiki-notes/', 'syntax': 'markdown', 'ext': '.md'}]
let g:vimwiki_diary_months = {
      \ 1: 'Januari', 2: 'Februari', 3: 'Maret',
      \ 4: 'April', 5: 'Mei', 6: 'Juni',
      \ 7: 'Juli', 8: 'Agustus', 9: 'September',
      \ 10: 'Oktober', 11: 'November', 12: 'Desember'
      \ }
]], false)
