return {
	'linux-cultist/venv-selector.nvim',
	dependencies = {
		{ 'folke/snacks.nvim' },
	},
	ft = 'python',
	keys = require('keybinds.plugins')['venv-selector'], -- Open picker on keymap
	opts = {
		options = {
			statusline_func = {
				lualine = function() -- called by lualine
					local venv_path = require('venv-selector').venv()
					if not venv_path or venv_path == '' then
						return ''
					end

					local venv_name = vim.fn.fnamemodify(venv_path, ':t')
					if not venv_name then
						return ''
					end

					local output = '🐍 ' .. venv_name .. ' ' -- Changes only the icon but you can change colors or use powerline symbols here.
					return output
				end,
			},
		}, -- plugin-wide options
		search = {}, -- custom search definitions
	},
}
