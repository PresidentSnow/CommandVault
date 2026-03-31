-- local variable
local map = vim.keymap.set

-- show lines with Ctrl + s/S
map('n', '<C-s>', function()
  print(vim.fn.line('$') .. ' lines')
end, { noremap = true, silent = false })

-- space + space to clean search highlight
map("n", "<Leader>h", ":noh<CR>", { silent = true })

-- indenting in visual mode (tab/shift + tab)
map("v", "<Tab>", ">gv")
map("v", "<S-Tab>", "<gv")
