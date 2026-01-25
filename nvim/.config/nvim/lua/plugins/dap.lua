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

		dap.configurations = {
			go = {
				{
					type = 'delve',
					name = 'Debug',
					request = 'launch',
					-- program = '${file}',
					program = '${workspaceFolder}',
				},
				{
					type = 'delve',
					name = 'Debug test', -- configuration for debugging test files
					request = 'launch',
					mode = 'test',
					program = '${file}',
				},
				-- works with go.mod packages and sub packages
				{
					type = 'delve',
					name = 'Debug test (go.mod)',
					request = 'launch',
					mode = 'test',
					program = './${relativeFileDirname}',
				},
			},
			javascript = {
				{
					name = 'Launch',
					type = 'node2',
					request = 'launch',
					program = '${file}',
					cwd = vim.fn.getcwd(),
					sourceMaps = true,
					protocol = 'inspector',
					console = 'integratedTerminal',
				},
				{
					-- For this to work you need to make sure the node process is started with the `--inspect` flag.
					name = 'Attach to process',
					type = 'node2',
					request = 'attach',
					processId = require('dap.utils').pick_process,
				},
			},
			javascriptreact = {
				{
					type = 'chrome',
					request = 'attach',
					program = '${file}',
					cwd = vim.fn.getcwd(),
					sourceMaps = true,
					protocol = 'inspector',
					port = 9222,
					webRoot = '${workspaceFolder}',
				},
			},
			typescriptreact = {
				{
					type = 'chrome',
					request = 'attach',
					program = '${file}',
					cwd = vim.fn.getcwd(),
					sourceMaps = true,
					protocol = 'inspector',
					port = 9222,
					webRoot = '${workspaceFolder}',
				},
			},
			python = {
				{
					-- The first three options are required by nvim-dap
					type = 'python', -- the type here established the link to the adapter definition: `dap.adapters.python`
					request = 'launch',
					name = 'Launch file',

					-- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options

					program = '${file}', -- This configuration will launch the current file if used.
					pythonPath = function()
						-- debugpy supports launching an application with a different interpreter then the one used to launch debugpy itself.
						-- The code below looks for a `venv` or `.venv` folder in the current directly and uses the python within.
						-- You could adapt this - to for example use the `VIRTUAL_ENV` environment variable.
						local cwd = vim.fn.getcwd()
						if vim.fn.executable(cwd .. '/venv/bin/python') == 1 then
							return cwd .. '/venv/bin/python'
						elseif vim.fn.executable(cwd .. '/.venv/bin/python') == 1 then
							return cwd .. '/.venv/bin/python'
						else
							return vim.fn.system({ 'which', 'python'  })
						end
					end,
				},
			},
		}
	end,
}
