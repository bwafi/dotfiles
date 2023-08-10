-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
--
--
local opt = vim.opt

-- Indent
opt.autoindent = true -- Copy indent from current line when starting a new line (When <CR> or 'o' or 'O')
opt.smarttab = true -- When on, a <Tab> in front of a line inserts blanks according to 'shiftwidth'
opt.encoding = "utf-8"
opt.fileencoding = "utf-8"
opt.breakindent = true
-- opt.relativenumber = false -- relative line numbers
-- opt.laststatus = 3
-- opt.cmdheight = 4
-- opt.cmdwinheight = 0
