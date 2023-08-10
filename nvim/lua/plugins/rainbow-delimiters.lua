return {
  {
    "hiphish/rainbow-delimiters.nvim",
    config = function()
      vim.g.rainbow_delimiters = {
        query = {
          javascript = "rainbow-parens",
          tsx = "rainbow-parens",
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
