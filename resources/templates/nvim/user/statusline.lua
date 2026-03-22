-- Configuration of shortcuts
local opt = vim.opt

-- Statusline (left side)
opt.statusline = ""
opt.statusline:append("%F %M %Y %R")
opt.statusline:append("%{strftime('%H:%M')}")
opt.statusline:append("[%{&fileencoding}:%{&fileformat}]")
opt.statusline:append("mode: %{mode()}")

-- Statusline (right side)
opt.statusline:append("%=")
opt.statusline:append("ascii: %b hex: 0x%B totalRow: %L row: %l col: %c percent: %p%%")
opt.laststatus = 2

