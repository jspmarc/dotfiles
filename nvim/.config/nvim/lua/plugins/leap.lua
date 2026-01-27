local plugin_keys = require('keybinds.plugins')

return {
	enabled = false,
	url = 'https://codeberg.org/andyg/leap.nvim',
	keys = plugin_keys.leap,
	lazy = false,
	opts = {
		preview = function(ch0, ch1, ch2)
			return not (ch1:match('%s') or (ch0:match('%a') and ch1:match('%a') and ch2:match('%a')))
		end,
	},
	config = function()
		require('leap.user').set_repeat_keys(';', ',')
	end,
}
