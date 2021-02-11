--------------------------------------------------
------------ vim-related keymappings -------------
--------------------------------------------------

-- leader maps
-- Leader is still backslash ( '\' , mapped to backspace)
map('n', '<space>', '<leader><leader>', {noremap = false})
map('', '<BS>', '<leader>', {noremap = false})

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

-- Toggle settings
map('', '<A-s>', ':set hls!<CR>')
map('', '<A-z>', ':set wrap!<CR>')

-- Makes indenting on visual more convinient
map('v', '<', '<gv')
map('v', '>', '>gv')

-- Automatically compile
map('n', '<leader>c', ':call CompileFile()<CR>')
map('n', '<leader>o', ':call RunFile()<CR>')

-- Fold
map('n', '<C-f>c', ':foldclose<CR>')
map('n', '<C-f>o', ':foldopen<CR>')

--map('n', '<C-b>', ':LF<CR>')
