return {
  {
    "hiphish/rainbow-delimiters.nvim",
    config = function()
      vim.g.rainbow_delimiters = {
        query = {
          javascript = "rainbow-parens",
          tsx = "rainbow-parens",
          html = "rainbow-parens",
          vue = "rainbow_delimiters",
        },
        highlight = {
          "RainbowDelimiterBlue",
          "RainbowDelimiterViolet",
          "RainbowDelimiterYellow",
          "RainbowDelimiterGreen",
          "RainbowDelimiterOrange",
          "RainbowDelimiterCyan",
          "RainbowDelimiterRed",
        },
      }
    end,
  },
}
