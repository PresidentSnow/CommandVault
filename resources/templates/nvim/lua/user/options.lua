local opt = vim.opt

-- Codex 
opt.encoding = "utf8"

-- Line number 
opt.number = true
opt.relativenumber = false

-- Indentation
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true

-- Visual
opt.wrap = true
opt.cursorline = true
opt.cursorcolumn = true
opt.termguicolors = true

-- Search 
opt.ignorecase = true
opt.hlsearch = true
opt.incsearch = true
opt.smartcase = true
opt.showmatch = true

-- General
opt.mouse = ""
opt.clipboard = "unnamedplus"
opt.confirm = true
opt.spell = true
opt.history = 20

-- Wildmenu 
vim.o.wildmenu = true
vim.o.wildmode = "list:longest"
vim.o.wildignore = "*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx"

-- Syntax highlighting
vim.cmd("syntax on")
