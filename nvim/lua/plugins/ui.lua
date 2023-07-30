return {

  -- lualine modify
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function()
      return {
        options = {
          theme = "auto",
          section_separators = { left = " ", right = "" },
          -- component_separators = { left = "", right = "" },
          -- section_separators = { left = "", right = "" },
          component_separators = { left = "", right = "" },
          --section_separators = { left = "", right = "" },
          -- component_separators = { left = "│", right = "│" },
          --section_separators = { left = " ", right = " " },
          --component_separators = { left = " ", right = " " },
          -- section_separators = { left = "", right = "" },
          -- component_separators = { left = " ", right = " " },
          -- section_separators = { left = " ", right = " " },
          globalstatus = true,
          disabled_filetypes = { statusline = { "dashboard", "alpha" } },
        },
      }
    end,
  },

  {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",

    opts = {
      options = {
        separator_style = "slope",
      },
    },
  },
}
