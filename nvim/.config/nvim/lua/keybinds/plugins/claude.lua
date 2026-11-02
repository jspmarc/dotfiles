local prefix = '<leader>a'

return {
	{
		prefix,
		group = 'Claude Code',
	},
	{
		prefix .. 'l',
		'<CMD>ClaudeCode<CR>',
		desc = 'Toggle Claude Code',
	},
	{
		prefix .. 'a',
		'<CMD>ClaudeCodeAdd %<CR>',
		mode = { 'n' },
		desc = 'Add current buffer to Claude Code',
	},
	{
		prefix .. 'a',
		'<CMD>ClaudeCodeSend<CR>',
		mode = { 'v' },
		desc = 'Send to Claude',
	},
	{
		prefix .. 'f',
		'<CMD>ClaudeCodeFocus<CR>',
		desc = 'Focus Claude Code',
	},
	{
		prefix .. 'o',
		function()
			local options = {
				{ label = 'Focus Claude Code', cmd = 'ClaudeCodeFocus' },
				{ label = 'Resume session',    cmd = 'ClaudeCode --resume' },
				{ label = 'Continue session',  cmd = 'ClaudeCode --continue' },
				{ label = 'Select model',      cmd = 'ClaudeCodeSelectModel' },
				{
					label = 'Add file',
					fn = function()
						Snacks.picker.files({
							confirm = function(picker, item)
								picker:close()
								if item then
									vim.cmd('ClaudeCodeAdd ' .. vim.fn.fnameescape(item.file))
								end
							end,
						})
					end,
				},
			}
			Snacks.picker.select(options, {
				prompt = 'Claude Code options',
				format_item = function(item)
					return item.label
				end,
			}, function(choice)
				if not choice then
					return
				end
				if choice.fn then
					choice.fn()
				else
					vim.cmd(choice.cmd)
				end
			end)
		end,
		desc = 'Claude Code options',
	},
	{
		prefix .. 'da',
		'<CMD>ClaudeCodeDiffAccept<CR>',
		desc = 'Accept diff',
	},
	{
		prefix .. 'dd',
		'<CMD>ClaudeCodeDiffDeny<CR>',
		desc = 'Deny diff',
	},
}
