local rainbow_delimiters = require "rainbow-delimiters"

vim.g.rainbow_delimiters = {
  strategy = {
    [""] = rainbow_delimiters.strategy["global"],
    vim = rainbow_delimiters.strategy["local"],
  },
  query = {
    javascript = "rainbow-parens",
    tsx = "rainbow-parens",
    html = "rainbow-parens",
    vue = "rainbow_delimiters",
  },
}
