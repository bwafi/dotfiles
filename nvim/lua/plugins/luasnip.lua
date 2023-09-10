return {
  {
    "L3MON4D3/LuaSnip",
    version = "2.*",
    event = "VeryLazy",
    dependencies = {
      "rafamadriz/friendly-snippets",
    },
    config = function()
      require("luasnip").setup({
        history = true,
        delete_check_events = "TextChanged",
      })
      require("luasnip.loaders.from_vscode").lazy_load()
      require("luasnip.loaders.from_vscode").lazy_load({ paths = { "./snippets/" } })
    end,
  },
}
