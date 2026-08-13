return {
	'MagicDuck/grug-far.nvim',
	cmd = { 'GrugFar' },
	keys = require('keybinds.plugins').grug,
	opts = {
		startInInsertMode = true,
		openTargetWindow = {
			preferredLocation = 'right',
		},
	},
}
