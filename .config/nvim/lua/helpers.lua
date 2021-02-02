local api = vim.api
local scopes = {o = vim.o, b = vim.bo, w = vim.wo}
-- o = global options
-- b = local buffer options
-- w = local window options

function map(mode, from, to, opts)
    local options = {noremap = true, silent = true}
    if opts then options = vim.tbl_extend('force', options, opts) end -- :h vim.tbl_extend()
    api.nvim_set_keymap(mode, from, to, options)
end

function set_opts(scope, key, value)
    scopes[scope][key] = value
    if scope ~= 'o' then -- some buffer option actually need to be set globally
                         -- too, might as well do the same for window options
        scopes['o'][key] = value
    end
end
