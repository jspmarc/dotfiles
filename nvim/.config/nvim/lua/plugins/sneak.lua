vim.g['sneak#label'] = 1

local plugin_keys = require('keybinds.plugins')

return {
	'justinmk/vim-sneak',
	keys = plugin_keys.sneak,
}
