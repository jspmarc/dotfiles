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

	-- resize windows
	{ '<leader>+',  ':exe "vertical resize +10"<CR>' },
	{ '<leader>_',  ':exe "vertical resize -10"<CR>' },
	{ '<leader>=',  ':exe "resize +5"<CR>' },
	{ '<leader>-',  ':exe "resize -5"<CR>' },

	-- Toggle settings
	{ '<A-s>',      ':set hls!<CR>' },
	{ '<A-z>',      ':set wrap!<CR>' },

	-- Makes indenting on visual more convinient
	{ '<',          '<gv',                           mode = 'v' },
	{ '>',          '>gv',                           mode = 'v' },

	-- Fold
	{ '<leader>fc', '<cmd>foldclose<CR>',            desc = 'Close fold' },
	{ '<leader>fo', '<cmd>foldopen<CR>',             desc = 'Open fold' },

	-- buffer
	{ '<leader>bd', '<cmd>bd<CR>',                   desc = 'Delete buffer' },
	{ '<C-n>',      ':enew<CR>',                     desc = 'New buffer' },

	-- colorscheme
	{
		'<leader>,s',
		function()
			require('helpers').set_colorscheme()
		end,
		desc = 'Set colorscheme',
	},
}
