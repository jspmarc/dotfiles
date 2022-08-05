local base = {
	texlab = {},
}

local default = {
	texlab = {
		build = {
			args = { '-pdflatex=lualatex', '-pdf', '-interaction=nonstopmode', '-synctex=1', '%f' },
			onSave = true,
		},
	},
}

local final_project_path = os.getenv('HOME') .. '/projects/kuliah/final-project-report'
local final_project = {
	texlab = {
		build = {
			executable = 'make',
			args = { 'build' },
			onSave = true,
		},
		rootDirectory = final_project_path,
	},
}

return {
	on_init = function(client)
		local path = client.workspace_folders[1].name

		if path == final_project_path then
			client.config.settings = vim.tbl_extend('force', base, final_project)
		else
			client.config.settings = vim.tbl_extend('force', base, default)
		end

		client.notify('workspace/didChangeConfiguration')
		return true
	end,
}
