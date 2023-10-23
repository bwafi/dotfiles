local oil = require "oil"

oil.setup {
  -- delete_to_trash = true,
  default_file_explorer = false,
}

vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory(Oil)" })
