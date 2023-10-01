-- local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })
--
-- This file is automatically loaded by plugins.core
local opt = vim.opt

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

opt.shortmess:append { W = true, I = true, c = true }
opt.breakindent = true
opt.list = true -- Show some invisible characters (tabs...
opt.scrolloff = 4 -- Lines of context
opt.confirm = true -- Confirm to save changes before exiting modified buffer
opt.smartcase = true -- Don't ignore case with capitals
opt.relativenumber = true -- Relative line numbers

if vim.fn.has "nvim-0.9.0" == 1 then
  opt.splitkeep = "screen"
  opt.shortmess:append { C = true }
end



-- disable mini.cursorword in nvim-tree
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "NvimTree" },
  callback = function()
    vim.b.minicursorword_disable = true
  end,
})

-- snippets
local lpath = vim.fn.stdpath "config" .. "/lua/custom/my-snippets"
vim.g.vscode_snippets_path = lpath
vim.g.snipmate_snippets_path = lpath
