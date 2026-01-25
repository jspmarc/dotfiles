-- guides used
-- - setting up DAP: https://tamerlan.dev/a-guide-to-debugging-applications-in-neovim/
-- - setting up DAP for TS: https://banjocode.com/post/nvim/debug-node

local function pick_script()
	local pilot = require('package-pilot')

	local current_dir = vim.fn.getcwd()
	local package = pilot.find_package_file({ dir = current_dir })

	if not package then
		vim.notify('No package.json found', vim.log.levels.ERROR)
		return require('dap').ABORT
	end

	local scripts = pilot.get_all_scripts(package)

	local label_fn = function(script)
		return script
	end

	local co, ismain = coroutine.running()
	local ui = require('dap.ui')
	local pick = (co and not ismain) and ui.pick_one or ui.pick_one_sync
	local result = pick(scripts, 'Select script', label_fn)
	return result or require('dap').ABORT
end

return {
	'mfussenegger/nvim-dap',
	event = 'VeryLazy',
	keys = require('keybinds.plugins').dap,
	dependencies = {
		'rcarriga/nvim-dap-ui',
		'nvim-neotest/nvim-nio',
		'jay-babu/mason-nvim-dap.nvim',
		'theHamsta/nvim-dap-virtual-text',
		'banjo/package-pilot.nvim',
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

		dap.adapters = {
			['pwa-node'] = {
				type = 'server',
				host = 'localhost',
				port = '${port}',
				executable = {
					command = vim.fn.exepath('js-debug-adapter'),
					args = { '${port}' },
				},
			},
		}

		local pwa_node_conf = {
			{
				type = 'pwa-node',
				request = 'launch',
				name = 'pick script (pnpm)',
				runtimeExecutable = 'pnpm',
				runtimeArgs = { 'run', pick_script },
				cwd = '${workspaceFolder}',
			},
			{
				type = 'pwa-node',
				request = 'launch',
				name = 'Launch file',
				program = '${file}',
				cwd = '${workspaceFolder}',
			},
			{
				type = 'pwa-node',
				request = 'attach',
				name = 'Attach to Node app',
				address = 'localhost',
				port = 9229,
				cwd = '${workspaceFolder}',
				restart = true,
			},
			{
				type = 'pwa-node',
				request = 'launch',
				name = 'Debug Jest Tests',
				-- trace = true, -- include debugger info
				runtimeExecutable = 'node',
				runtimeArgs = {
					'./node_modules/jest/bin/jest.js',
					'--runInBand',
				},
				rootPath = '${workspaceFolder}',
				cwd = '${workspaceFolder}',
				console = 'integratedTerminal',
				internalConsoleOptions = 'neverOpen',
			},
			-- {
			-- 	type = 'pwa-node',
			-- 	name = 'Launch',
			-- 	request = 'launch',
			-- 	trace = true,
			-- 	program = '${workspaceFolder}/bin',
			-- 	cwd = '${workspaceFolder}',
			-- 	rootPath = '${workspaceFolder}',
			-- 	skipFiles = { '<node_internals>/**/*.js' },
			-- 	resolveSourceMapLocations = {
			-- 		'${workspaceFolder}/**',
			-- 		'!**/node_modules/**',
			-- 	},
			-- 	protocol = 'inspector',
			-- 	console = 'integratedTerminal',
			-- },
			-- {
			-- 	type = 'pwa-node',
			-- 	name = 'Attach To Process',
			-- 	request = 'attach',
			-- 	cwd = '${workspaceFolder}/src',
			-- 	resolveSourceMapLocations = {
			-- 		'${workspaceFolder}/**',
			-- 		'!**/node_modules/**',
			-- 	},
			-- 	protocol = 'inspector',
			-- 	console = 'integratedTerminal',
			-- 	processId = require('dap.utils').pick_process,
			-- 	port = 9229,
			-- },
		}
		for _, i in ipairs({ 'javascript', 'typescript', 'javascriptreact', 'typescriptreact' }) do
			dap.configurations[i] = pwa_node_conf
		end
	end,
}
