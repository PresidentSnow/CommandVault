-- Statusline
vim.opt.statusline = ""
vim.opt.statusline:append("%F %M %Y %R")
vim.opt.statusline:append("%=")
vim.opt.statusline:append("ascii: %b hex: 0x%B row: %l col: %c percent: %p%%")
vim.opt.laststatus = 2

