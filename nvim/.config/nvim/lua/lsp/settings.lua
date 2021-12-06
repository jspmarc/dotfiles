require('lsp.keybinds')
require('lsp.installer')

-- css
-- nvim_lsp.cssls.setup{}

-- docker
-- nvim_lsp.dockerls.setup{}

-- go
-- nvim_lsp.gopls.setup {}

-- html
-- nvim_lsp.html.setup {}

-- javascript
-- nvim_lsp.tsserver.setup{}

-- json
--[[ nvim_lsp.jsonls.setup {
	commands = {
		Format = {
			function()
				vim.lsp.buf.range_formatting({},{0,0},{vim.fn.line("$"),0})
			end
		}
	},
} ]]

-- Lua
--[[ local system_name
if vim.fn.has("mac") == 1 then
  system_name = "macOS"
elseif vim.fn.has("unix") == 1 then
  system_name = "Linux"
elseif vim.fn.has('win32') == 1 then
  system_name = "Windows"
else
  print("Unsupported system for sumneko")
end
local sumneko_root_path = os.getenv('HOME') .. '/.config/nvim/lua/lsp/language-servers/lua-language-server'
local sumneko_binary = sumneko_root_path .. "/bin/" .. system_name .. "/lua-language-server"

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

nvim_lsp.sumneko_lua.setup {
	cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"};
	settings = {
		Lua = {
			runtime = {
				-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
				version = 'LuaJIT',
				-- Setup your lua path
				path = runtime_path,
			},
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = {'vim'},
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = vim.api.nvim_get_runtime_file("", true),
			},
				-- Do not send telemetry data containing a randomized but unique identifier
				telemetry = {
				enable = false,
			},
		},
	},
} ]]

-- python
-- nvim_lsp.pylsp.setup{}

-- rust
--[[ nvim_lsp.rust_analyzer.setup {
	settings = {
		["rust_analyzer"] = {
			checkOnSave = {
				enable = true,
				command = 'clippy',
			}
		}
	}
}
 ]]

-- svelte
-- nvim_lsp.svelte.setup {}

-- tailwind
-- nvim_lsp.tailwindcss.setup{}

-- vim
-- nvim_lsp.vimls.setup{}
