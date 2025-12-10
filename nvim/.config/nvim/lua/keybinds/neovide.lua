local is_mac = require('helpers').is_mac

local keybinds = {}

if is_mac then
	keybinds = {
		{
			'<D-v>',
			function()
				vim.api.nvim_paste(vim.fn.getreg('+'), true, -1)
			end,
			mode = { 'n', 'v', 's', 'x', 'o', 'i', 'l', 'c', 't' },
			{ noremap = true, silent = true },
		},
	}
else
	keybinds = {
		{
			'<C-S-v>',
			function()
				vim.api.nvim_paste(vim.fn.getreg('+'), true, -1)
			end,
			mode = { 'n', 'v', 's', 'x', 'o', 'i', 'l', 'c', 't' },
			{ noremap = true, silent = true },
		},
	}
end

return keybinds
