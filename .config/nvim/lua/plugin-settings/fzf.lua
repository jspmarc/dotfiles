local g, api = vim.g, vim.api

g.fzf_layout = {
    window = {
        width = 0.8,
        height = 0.8
    }
}
api.nvim_command([[let $FZF_DEFAULT_OPTS = '--reverse']])
