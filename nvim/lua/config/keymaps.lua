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

map("i", "jj", "<esc>", { noremap = true })

-- map({ "i", "v", "n", "s" }, "<C-j>", "<cmd>w<cr>", { desc = "Save file" })
-- map("i", "<C-k>", "<cmd>w<cr>", { desc = "save file" })
-- floating terminal sdv
-- local lazyterm = function()
--   Util.float_term(nil, { size = { width = 0.7, height = 0.7 }, cwd = Util.get_root() })
-- end
-- map("n", "<leader>ft", lazyterm, { desc = "Terminal (root dir)" })
-- map("n", "<leader>fT", function()
--   Util.float_term({ size = { width = 0.7, height = 0.7 } })
-- end, { desc = "Terminal (cwd)" })
-- map("n", "<c-/>", lazyterm, { desc = "Terminal (root dir)" })
-- map("n", "<c-_>", lazyterm, { desc = "which_key_ignore" })

--
-- map("n", "<leader>ft", function () lazyterm()
--
-- end)

-- close all buffers
map("n", "<leader>bo", "<cmd>%bd|e#|bd#<cr>", { desc = "Close all buffers but the current one" })
