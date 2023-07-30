return {
  {
    { "Shatur/neovim-ayu", priority = 1000 },

    { "ellisonleao/gruvbox.nvim" },

    {
      "Tsuzat/NeoSolarized.nvim",
      opts = {
        transparent = false,
      },
    },

    { "joshdick/onedark.vim" },

    { "drewtempelmeyer/palenight.vim" },
    -- {
    --   "folke/tokyonight.nvim",
    --   -- lazy = false,
    --   priority = 1000,
    --   opts = {},
    -- },

    -- -- Configure LazyVim to load default theme
    {
      "LazyVim/LazyVim",
      opts = {
        colorscheme = "tokyonight-storm",
        -- colorscheme = "NeoSolarized",
      },
    },
  },
}
