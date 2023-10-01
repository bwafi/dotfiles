local oil = require "oil"

oil.setup {
  -- delete_to_trash = true,
  keymaps = {
    ["g?"] = "actions.show_help",
    ["<CR>"] = "actions.select",
    ["<C-p>"] = "actions.preview",
    ["q"] = "actions.close",
    ["<C-l>"] = "actions.refresh",
    ["-"] = "actions.parent",
    ["_"] = "actions.open_cwd",
    ["`"] = "actions.cd",
    ["~"] = "actions.tcd",
    ["gs"] = "actions.change_sort",
    ["gx"] = "actions.open_external",
    ["g."] = "actions.toggle_hidden",
  },
}

vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory(Oil)" })
