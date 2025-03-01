return {
	-- leader maps
	-- Leader is still backslash ( '\' ), mapped to backspace
	-- TODO: use proxy
	{ '<space>',    '<leader><leader>',              noremap = false },
	{ '<BS>',       '<leader>',                      noremap = false },

	-- double Esc to return to normal mode from term mode
	{ '<Esc><Esc>', '<C-\\><C-n>',                   mode = 't' },

	-- <C-h><C-l> to return to normal mode
	{ '<C-h><C-l>', '<C-\\><C-n>',                   mode = { 'i', 't', 'v' } },

	-- spawn a window terminal on bottom of screen
	-- { '<leader><C-t>', '<C-w>s<C-w>r:exe \'resize -15\'<CR>:term<CR>G' },

	-- now <S-y> acts like <S-d> but yanking
	{ '<S-y>',      'y$' },

	-- bind page up and down to <C-up> and <C-down>
	{ '<PageUp>',   '<C-u>' },
	{ '<PageDown>', '<C-d>' },

	-- moving between windows using Alt
	{ '<A-h>',      '<C-w>h',                        mode = { 'n', 'i', 'v', 't' } },
	{ '<A-j>',      '<C-w>j',                        mode = { 'n', 'i', 'v', 't' } },
	{ '<A-k>',      '<C-w>k',                        mode = { 'n', 'i', 'v', 't' } },
	{ '<A-l>',      '<C-w>l',                        mode = { 'n', 'i', 'v', 't' } },

	-- Toggle settings
	{ '<A-s>',      '<cmd>set hls!<CR>' },
	{ '<A-z>',      '<cmd>set wrap!<CR>' },

	-- Makes indenting on visual more convinient
	{ '<',          '<gv',                           mode = 'v' },
	{ '>',          '>gv',                           mode = 'v' },
}
