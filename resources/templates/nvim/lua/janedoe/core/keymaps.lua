-- local variable
local map = vim.keymap.set

-- show lines with Ctrl + s/S
vim.keymap.set('n', '', function()
print(vim.fn.line('$') .. ' lines')
end, { noremap = true, silent = false })
