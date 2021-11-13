require'formatter'.setup({
    logging = false,
    filetype = {
        -- js and family
        javascript = {
            function()
                return {
                    exe = 'prettier',
                    args = {'--stdin-filepath', vim.api.nvim_buf_get_name(0)},
                    stdin = true
                }
            end
        },
        javascriptreact = {
            function()
                return {
                    exe = 'prettier',
                    args = {'--stdin-filepath', vim.api.nvim_buf_get_name(0)},
                    stdin = true
                }
            end
        },

        -- ts and family
        typescript = {
            function()
                return {
                    exe = 'prettier',
                    args = {'--stdin-filepath', vim.api.nvim_buf_get_name(0)},
                    stdin = true
                }
            end
        },
        typescriptreact = {
            function()
                return {
                    exe = 'prettier',
                    args = {'--stdin-filepath', vim.api.nvim_buf_get_name(0)},
                    stdin = true
                }
            end
        },

        -- vue
        vue = {
            function()
                return {
                    exe = 'prettier',
                    args = {'--stdin-filepath', vim.api.nvim_buf_get_name(0)},
                    stdin = true
                }
            end
        },

        -- svelte
        svelte = {
            function()
                return {
                    exe = 'prettier',
                    args = {'--stdin-filepath', vim.api.nvim_buf_get_name(0)},
                    stdin = true
                }
            end
        },

        -- lua
        lua = {function() return {exe = 'lua-format', stdin = true} end},

        -- rust
        rust = {
            function()
                return {exe = 'rustfmt', args = {'--emit=stdout'}, stdin = true}
            end
        },

        -- clang family
        cpp = {
            function()
                return {
                    exe = 'clang-format',
                    args = {'--asume-filename', vim.api.nvim_buf_get_name(0)}
                }
            end
        },
        c = {
            function()
                return {
                    exe = 'clang-format',
                    args = {'--asume-filename', vim.api.nvim_buf_get_name(0)}
                }
            end
        }
    }
})

vim.api.nvim_exec([[
augroup FormatAutogroup
  autocmd!
  " js and family
  autocmd BufWritePost *.js FormatWrite
  autocmd BufWritePost *.jsx FormatWrite

  " ts and family
  autocmd BufWritePost *.ts FormatWrite
  autocmd BufWritePost *.tsx FormatWrite

  " lua
  autocmd BufWritePost *.lua FormatWrite

  " rust
  autocmd BufWritePost *.rs FormatWrite

  " clang family
  autocmd BufWritePost *.cpp FormatWrite
  autocmd BufWritePost *.hpp FormatWrite
  autocmd BufWritePost *.c FormatWrite
  autocmd BufWritePost *.h FormatWrite
augroup END
]], true)
