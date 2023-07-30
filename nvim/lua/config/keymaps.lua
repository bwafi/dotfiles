-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set
-- local del = vim.keymap.del
local Util = require("lazyvim.util")

-- Lazygit change size of window
map("n", "<leader>gg", function()
  Util.float_term({ "lazygit" }, { size = { width = 1.0, height = 1.0 }, cwd = Util.get_root() })
end, { desc = "Lazygit (root dir)" })
map("n", "<leader>gG", function()
  Util.float_term({ "lazygit" }, { size = { width = 1.0, height = 1.0 } })
end, { desc = "Lazygit (cwd dir)" })

-- close all buffers
map("n", "<leader>bo", "<cmd>%bd|e#<cr>", { desc = "Close all buffers but the current one" })
