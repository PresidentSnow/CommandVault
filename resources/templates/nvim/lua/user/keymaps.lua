-- line number
vim.api.nvim_set_keymap('n', '<C-s>', ':echo (line(\'$\') .. " lines")<CR>', { noremap = true, silent = true })

