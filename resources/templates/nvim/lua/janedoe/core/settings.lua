-- local variable
local opt = vim.opt
local general = vim.o
local map = vim.g
local cmd = vim.cmd

--[[
============================================================================
GENERAL OPTIONS
============================================================================
]]

-- encoding
opt.encoding = "utf-8"

-- line number
opt.number = true
opt.relativenumber = false

-- visual
opt.wrap = true
opt.cursorline = true
opt.cursorcolumn = true
opt.termguicolors = true

-- search
opt.hlsearch = true
opt.ignorecase = true
opt.incsearch = true
opt.smartcase = true
opt.showmatch = true

-- indentation
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true

-- map as the leader key
map.mapleader = ""
map.maplocalleader = ""

-- general
general.mouse= ""
general.clipboard = "unnamedplus"
opt.syntax = "enable"
-- cmd("Syntax on")

--[[
============================================================================
TEMPORARY FILES
============================================================================
]]

opt.swapfile = false
opt.backup = false
opt.writebackup = false
opt.undofile = false

-- opt.directory = "~/.cache/nvim/swap//"
-- opt.backupdir = "~/.cache/nvim/backup//"
-- opt.undodir = "~/.cache/nvim/undo//"

-- Automatic read/write
opt.autoread = true
opt.autowrite = true

-- Path and file behavior
opt.wildignore = { "*.o", "*.a", "__pycache__", "*.class" }
opt.suffixesadd = { ".lua", ".js", ".ts" }

--[[
============================================================================
SCROLL
============================================================================
]]

opt.scrolloff = 8
opt.sidescrolloff = 15
opt.sidescroll = 5
