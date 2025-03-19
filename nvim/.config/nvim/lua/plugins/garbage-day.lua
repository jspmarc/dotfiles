return {
	'zeioth/garbage-day.nvim',
	dependencies = 'neovim/nvim-lspconfig',
	event = 'VeryLazy',
	opts = {
		-- your options here
		excluded_lsp_clients = {
			'copilot',
			'null-ls',
			'jdtls',
			'marksman',
			'lua_ls', -- see: https://github.com/Zeioth/garbage-day.nvim/commit/750ef08ae6031ee3683014c5349144340c08ead6
		},
	},
}
