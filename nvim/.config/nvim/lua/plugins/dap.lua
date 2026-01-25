-- guide used: https://tamerlan.dev/a-guide-to-debugging-applications-in-neovim/

return {
	'mfussenegger/nvim-dap',
	event = 'VeryLazy',
	keys = require('keybinds.plugins').dap,
	dependencies = {
		'rcarriga/nvim-dap-ui',
		'nvim-neotest/nvim-nio',
		'jay-babu/mason-nvim-dap.nvim',
		'theHamsta/nvim-dap-virtual-text',
	},
	config = function()
		local dap = require('dap')
		local ui = require('dapui')
		local dap_virtual_text = require('nvim-dap-virtual-text')

		dap_virtual_text.setup()
		ui.setup()

		vim.fn.sign_define('DapBreakpoint', { text = '🔴' })

		-- use nvim-dap events to open and close the windows automatically
		dap.listeners.before.attach.dapui_config = function()
			ui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			ui.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			ui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			ui.close()
		end
	end,
}
