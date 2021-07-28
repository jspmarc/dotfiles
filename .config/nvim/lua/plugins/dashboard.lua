local map = require('helpers').map

vim.g.dashboard_default_executive  = 'telescope'

vim.g.dashboard_custom_header = {
    '',
    '',
    '        ⢀⣴⡾⠃     ⠈⠺⠟⠛⠛⠛⠛⠻⢿⣿⣿⣿⣿⣶⣤⡀  ',
    '      ⢀⣴⣿⡿⠁              ⣸⣿⣿⣿⣿⣿⣿⣿⣷ ',
    '     ⣴⣿⡿⡟⡼⢹⣷⢲⡶⣖⣾⣶⢄     ⢀⣼⣿⢿⣿⣿⣿⣿⣿⣿⣿ ',
    '    ⣾⣿⡟⣾⡸⢠⡿⢳⡿⠍⣼⣿⢏⣿⣷⢄⡀ ⢠⣾⢻⣿⣸⣿⣿⣿⣿⣿⣿⣿ ',
    '  ⣡⣿⣿⡟⡼⡁⠁⣰⠂⡾⠉⢨⣿⠃⣿⡿⠍⣾⣟⢤⣿⢇⣿⢇⣿⣿⢿⣿⣿⣿⣿⣿ ',
    ' ⣱⣿⣿⡟⡐⣰⣧⡷⣿⣴⣧⣤⣼⣯⢸⡿⠁⣰⠟⢀⣼⠏⣲⠏⢸⣿⡟⣿⣿⣿⣿⣿⣿ ',
    ' ⣿⣿⡟⠁ ⠟⣁ ⢡⣿⣿⣿⣿⣿⣿⣦⣼⢟⢀⡼⠃⡹⠃⡀⢸⡿⢸⣿⣿⣿⣿⣿⡟ ',
    ' ⣿⣿⠃ ⢀⣾⠋⠓⢰⣿⣿⣿⣿⣿⣿⠿⣿⣿⣾⣅⢔⣕⡇⡇⡼⢁⣿⣿⣿⣿⣿⣿⢣ ',
    ' ⣿⡟  ⣾⣇⠷⣢⣿⣿⣿⣿⣿⣿⣿⣭⣀⡈⠙⢿⣿⣿⡇⡧⢁⣾⣿⣿⣿⣿⣿⢏⣾ ',
    ' ⣿⡇ ⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⢻⠇  ⢿⣿⡇⢡⣾⣿⣿⣿⣿⣿⣏⣼⣿ ',
    ' ⣿⣷⢰⣿⣿⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⢰⣧⣀⡄⢀⠘⡿⣰⣿⣿⣿⣿⣿⣿⠟⣼⣿⣿ ',
    ' ⢹⣿⢸⣿⣿⠟⠻⢿⣿⣿⣿⣿⣿⣿⣿⣶⣭⣉⣤⣿⢈⣼⣿⣿⣿⣿⣿⣿⠏⣾⣹⣿⣿ ',
    ' ⢸⠇⡜⣿⡟⠄⠄⠄⠈⠙⣿⣿⣿⣿⣿⣿⣿⣿⠟⣱⣻⣿⣿⣿⣿⣿⠟⠁⢳⠃⣿⣿⣿ ',
    '  ⣰⡗⠹⣿⣄⠄⠄⠄⢀⣿⣿⣿⣿⣿⣿⠟⣅⣥⣿⣿⣿⣿⠿⠋  ⣾⡌⢠⣿⡿⠃ ',
    ' ⠜⠋⢠⣷⢻⣿⣿⣶⣾⣿⣿⣿⣿⠿⣛⣥⣾⣿⠿⠟⠛⠉            ',
    '',
    '',
}

vim.g.dashboard_custom_shortcut = {
  last_session       = 'LDR s l',
  find_history       = 'LDR f h',
  find_file          = 'LDR f f',
  new_file           = 'CTRL  n',
  change_colorscheme = 'LDR f c',
  find_word          = 'LDR f r',
  book_marks         = 'LDR f b',
}

----- keybindings -----
-- session
map('n', '<leader>ss', ':SessionSave<CR>')
map('n', '<leader>sl', ':SessionLoad<CR>')
map('n', '<C-n>', ':DashboardNewFile<CR>')
