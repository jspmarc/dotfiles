local map = require('helpers').map

-- leader maps
-- Leader is still backslash ( '\' ), mapped to backspace
map('n', '<space>', '<leader><leader>', { noremap = false })
map('', '<BS>', '<leader>', { noremap = false })

-- double Esc to return to normal mode from term mode
map('t', '<Esc><Esc>', '<C-\\><C-n>')

-- <C-h><C-l> to return to normal mode
map('i', '<C-h><C-l>', '<C-\\><C-n>')
map('t', '<C-h><C-l>', '<C-\\><C-n>')
map('v', '<C-h><C-l>', '<C-\\><C-n>')

-- spawn a window terminal on bottom of screen
-- map('n', '<leader><C-t>', '<C-w>s<C-w>r:exe \'resize -15\'<CR>:term<CR>G')

-- now <S-y> acts like <S-d> but yanking
map('n', '<S-y>', 'y$')

-- bind page up and down to <C-up> and <C-down>
map('n', '<PageUp>', '<C-u>')
map('n', '<PageDown>', '<C-d>')

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

-- Fold
map('n', '<leader>fc', '<cmd>foldclose<CR>')
map('n', '<leader>fo', '<cmd>foldopen<CR>')

-- buffer
map('n', '<leader>bd', '<cmd>bd<CR>')
map('n', '<C-n>', ':enew<CR>')

map('n', '<C-p>', ':')

-- map('n', '<leader>gg', ':!tmux new-window -c ' .. vim.fn.getcwd() .. ' -- lazygit <CR><CR>')
