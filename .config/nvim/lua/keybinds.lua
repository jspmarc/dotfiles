local api, g = vim.api, vim.g

local function map(mode, from, to, opts)
    local options = {noremap = true}
    if opts then options = vim.tbl_extend('force', options, opts) end -- :h vim.tbl_extend()
    api.nvim_set_keymap(mode, from, to, options)
end

--------------------------------------------------
------------ vim-related keymappings -------------
--------------------------------------------------

-- leader maps
-- Leader is still backslash ( '\' , mapped to backspace)
map('n', '<space>', '<leader><leader>', {noremap = false})
map('', '<BS>', '<leader>', {noremap = false, silent = false})

-- double Esc to return to normal mode from term mode
map('t', '<Esc><Esc>', '<C-\\><C-n>')

-- <C-h><C-l> to return to normal mode
map('i', '<C-h><C-l>', '<C-\\><C-n>')
map('t', '<C-h><C-l>', '<C-\\><C-n>')
map('v', '<C-h><C-l>', '<C-\\><C-n>')

-- spawn a window terminal on bottom of screen
map('n', '<leader><C-t>', '<C-w>s<C-w>r:exe \'resize -10\'<CR>:term<CR>G')

-- now <S-y> acts like <S-d> but yanking
map('n', '<S-y>', 'y$')

-- moving between windows using Alt
map('n', '<A-h>', '<C-w>h')
map('n', '<A-j>', '<C-w>j')
map('n', '<A-k>', '<C-w>k')
map('n', '<A-l>', '<C-w>l')

map('i', '<A-h>', '<C-w>h')
map('i', '<A-j>', '<C-w>j')
map('i', '<A-k>', '<C-w>k')
map('i', '<A-l>', '<C-w>l')

map('v', '<A-h>', '<C-w>h')
map('v', '<A-j>', '<C-w>j')
map('v', '<A-k>', '<C-w>k')
map('v', '<A-l>', '<C-w>l')

map('t', '<A-h>', '<C-w>h')
map('t', '<A-j>', '<C-w>j')
map('t', '<A-k>', '<C-w>k')
map('t', '<A-l>', '<C-w>l')

-- resize windows
map('n', '<leader>+', ':exe "vertical resize +10"<CR>')
map('n', '<leader>_', ':exe "vertical resize -10"<CR>')
map('n', '<leader>=', ':exe "resize +5"<CR>')
map('n', '<leader>-', ':exe "resize -5"<CR>')

-- tab-related
--map('n', '<A-e>', ':tabn<CR>')
--map('n', '<A-1>', ':tabp<CR>')
--map('n', '<A-t>', ':tabnew<CR>')
--map('n', '<A-w>', ':tabclose<CR>')

--map('i', '<A-e>', ':tabn<CR>')
--map('i', '<A-1>', ':tabp<CR>')
--map('i', '<A-t>', ':tabnew<CR>')
--map('i', '<A-w>', ':tabclose<CR>')

--map('t', '<A-e>', ':tabn<CR>')
--map('t', '<A-1>', ':tabp<CR>')
--map('t', '<A-t>', ':tabnew<CR>')
--map('t', '<A-w>', ':tabclose<CR>')

--map('v', '<A-e>', ':tabn<CR>')
--map('v', '<A-1>', ':tabp<CR>')
--map('v', '<A-t>', ':tabnew<CR>')
--map('v', '<A-w>', ':tabclose<CR>')

-- Toggle settings
map('', '<A-s>', ':set hls!<CR>')
map('', '<A-z>', ':set wrap!<CR>')

-- Makes indenting on visual more convinient
map('v', '<', '<gv')
map('v', '>', '>gv')

-- Automatically compile
map('n', '<leader>c', ':call CompileFile()<CR>')
map('n', '<leader>o', ':call RunFile()<CR>')

----------------------------------
------------ plugins -------------
----------------------------------

--[[
Plugins with custom keybindings:
- Mundo
- CoC
- easymotion
- floaterm
- fugtive.vim
- FZF
- git gutter
- NVIM Tree-Sitter
- NERDTree
- NERDCommenter
- Mundo
--]]

--- CoC ---
map('n', '<leader>E', ':CocList diagnostics<CR>')
map('n', '<leader>e', ':CocDiagnostics<CR>')

map('n', 'gd', '<Plug>(coc-definition)', {noremap = false})
map('n', 'gy', '<Plug>(coc-type-definition)', {noremap = false})
map('n', 'gi', '<Plug>(coc-implementation)', {noremap = false})
map('n', 'gr', '<Plug>(coc-references)', {noremap = false})

map('i', '<C-space>', 'coc#refresh()', {expr = true})

-- CoC-Prettier
map('v', '<leader>fp', '<Plug>(coc-format-selected)')

--- easymotion ---
map('n', '<leader><leader>f', '<Plug>(easymotion-overwin-f)', {noremap = false})
map('n', '<leader><leader>w', '<Plug>(easymotion-overwin-w)', {noremap = false})
map('n', '<leader><leader>e', '<Plug>(easymotion-e)', {noremap = false})
map('n', '<leader><leader>b', '<Plug>(easymotion-b)', {noremap = false})
map('n', '<leader><leader>j', '<Plug>(easymotion-j)', {noremap = false})
map('n', '<leader><leader>k', '<Plug>(easymotion-k)', {noremap = false})

--- floaterm ---
map('n', '<leader>tn', ':FloatermNew<CR>', {noremap = false})
map('n', '<leader>tc', ':FloatermKill<CR>', {noremap = false})
map('n', '<leader>tt', ':FloatermToggle<CR>', {noremap = false})
map('n', [[<leader>t[]], ':FloatermPrev<CR>', {noremap = false})
map('n', '<leader>t]', ':FloatermNext<CR>', {noremap = false})
map('t', '<leader>t{', ':FloatermFirst<CR>', {noremap = false})
map('t', '<leader>t}', ':FloatermLast<CR>', {noremap = false})
--map('n', '<leader>tl', ':CocList floaterm<CR>', {noremap = false})

map('t', '<leader>tn', '<C-\\><C-n>:FloatermNew<CR>', {noremap = false})
map('t', '<leader>tc', '<C-\\><C-n>:FloatermKill<CR>', {noremap = false})
map('t', '<leader>tt', '<C-\\><C-n>:FloatermToggle<CR>', {noremap = false})
map('t', [[<leader>t[]], '<C-\\><C-n>:FloatermPrev<CR>', {noremap = false})
map('t', '<leader>t]', '<C-\\><C-n>:FloatermNext<CR>', {noremap = false})
map('t', '<leader>t{', '<C-\\><C-n>:FloatermFirst<CR>', {noremap = false})
map('t', '<leader>t}', '<C-\\><C-n>:FloatermLast<CR>', {noremap = false})
--map('t', '<leader>tl', '<C-\><C-n>:CocList floaterm<CR>', {noremap = false})

--- fugtive.vim ---
map('n', '<leader>gs', ':G<CR>')
map('n', '<leader>ga', ':G add --patch<CR>')
map('n', '<leader>gh', ':diffget //3<CR>')
map('n', '<leader>gf', ':diffget //2<CR>')
map('n', '<leader>gd', ':G diff<CR>')

--- FZF ---
map('n', '<C-f>', ':BLines<CR>')
map('n', '<C-p>', ':Buffers<CR>')

--- Git gutter ---
map('n', '<leader>g]', ':GitGutterNextHunk<CR>')
map('n', '<leader>g[', ':GitGutterPrevHunk<CR>')
map('n', '<leader>gp', ':GitGutterPreviewHunk<CR>')
map('n', '<leader>gg', ':GitGutterStageHunk<CR>')
map('n', '<leader>gu', ':GitGutterUndoHunk<CR>')

--- NVIM Tree-Sitter ---
map('n', '<leader>fc', ':foldclose<CR>')
map('n', '<leader>fo', ':foldopen<CR>')

--- NERDTree ---
map('n', '<C-b>', ':NERDTreeToggle<CR>')

--- NERDCommenter ---
map('n', '<C-_>', '<Plug>NERDCommenterToggle', {noremap = false})
map('v', '<C-_>', '<Plug>NERDCommenterToggle', {noremap = false})

--- Mundo ---
map('n', '<C-z>', ':MundoToggle<CR>')
