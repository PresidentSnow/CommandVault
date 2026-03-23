-- Configuration of shortcuts
local opt = vim.opt

-- clear the previous 'statusline' conf
opt.statusline = ""
opt.laststatus = 2

-- Statusline (left side)
opt.statusline:append("%f %M %Y %R")
--opt.statusline:append("%{strftime('%H:%M')}")
opt.statusline:append("[%{&fileencoding}:%{&fileformat}]")
--opt.statusline:append("mode: %{mode()}")
opt.statusline:append("%p%%")

-- Statusline (right side)
opt.statusline:append("%=")
opt.statusline:append("ascii: %b hex: 0x%B ln: %l/%L col: %c")
