return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = {
    "windwp/nvim-ts-autotag",
  },

  opts = {
    autotag = {
      -- Setup autotag using treesitter config.
      enable = true,
      enable_rename = true,
      enable_close = true,
      enable_close_on_slash = false,
    },
    rainbow = {
      enable = true,
      extended_mode = true,
      max_file_lines = 1000,
    },
  },
}
