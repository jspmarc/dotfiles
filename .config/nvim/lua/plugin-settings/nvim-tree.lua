local g = vim.g

g.nvim_tree_side = 'left' -- left by default
g.nvim_tree_width = 30 -- 30 by default
g.nvim_tree_ignore = { '.git', 'node_modules', '.cache' } -- empty by default
g.nvim_tree_auto_open = 0 -- 0 by default, opens the tree when typing `vim $DIR` or `vim`
g.nvim_tree_auto_close = 1 -- 0 by default, closes the tree when it's the last window
g.nvim_tree_quit_on_open = 1 -- 0 by default, closes the tree when you open a file
g.nvim_tree_follow = 0 -- 0 by default, this option allows the cursor to be updated when entering a buffer
g.nvim_tree_indent_markers = 1 -- 0 by default, this option shows indent markers when folders are open
g.nvim_tree_hide_dotfiles = 1 -- 0 by default, this option hides files and folders starting with a dot `.`
g.nvim_tree_git_hl = 1 -- 0 by default, will enable file highlight for git attributes (can be used without the icons).
g.nvim_tree_root_folder_modifier = ':~' -- This is the default. See :help filename-modifiers for more options
g.nvim_tree_tab_open = 1 -- 0 by default, will open the tree when entering a new tab and the tree was previously open
g.nvim_tree_width_allow_resize  = 1 -- 0 by default, will not resize the tree when opening a file
g.nvim_tree_show_icons = {
    git = 1,
    folders = 0,
    files = 0,
}
-- If 0, do not show the icons for one of 'git' 'folder' and 'files'
-- 1 by default, notice that if 'files' is 1, it will only display
-- if nvim-web-devicons is installed and on your runtimepath

--  You can edit keybindings be defining this variable
--  You don't have to define all keys.
--  NOTE= the 'edit' key will wrap/unwrap a folder and open a file
g.nvim_tree_bindings = {
    edit =            {'<CR>', 'o'},
    edit_vsplit =     '<C-v>',
    edit_split =      '<C-x>',
    edit_tab =        '<C-t>',
    close_node =      {'<S-CR>', '<BS>'},
    toggle_ignored =  'I',
    toggle_dotfiles = 'H',
    refresh =         'R',
    preview =         '<Tab>',
    cd =              '<C-]>',
    create =          'a',
    remove =          'd',
    rename =          'r',
    cut =             'x',
    copy =            'c',
    paste =           'p',
    prev_git_item =   '[c',
    next_git_item =   ']c',
    dir_up =          '-',
    close =           'q',
}

--  Disable default mappings by plugin
--  Bindings are enable by default, disabled on any non-zero value
--  let nvim_tree_disable_keybindings=1

--  default will show icon by default if no icon is provided
--  default shows no icon by default
g.nvim_tree_icons = {
    default = '',
    symlink = '',
    git = {
        unstaged = "✗" ,
        staged = "✓" ,
        unmerged = "禛" ,
        renamed = "➜" ,
        untracked = "★",
    },
    folder = {
        default = "爏" ,
        open = "㖄" ,
        symlink = "蹨" ,
    },
}

----- keybindings -----
map('n', '<C-b>', ':NvimTreeToggle<CR>')
