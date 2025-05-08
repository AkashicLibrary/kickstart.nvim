local tmux = require 'tmux'
tmux.setup()
vim.keymap.set('n', 'm', '<cmd>Neorg<CR>', { desc = 'Neorg menu' })
