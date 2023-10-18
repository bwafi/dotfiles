local luasnip = require "luasnip"

luasnip.filetype_extend("javascript", { "javascriptreact" })
luasnip.filetype_extend("typescript", { "typescriptreact" })
luasnip.filetype_extend("javascriptreact", { "html" })
luasnip.filetype_extend("typescriptreact", { "html" })

require("luasnip.loaders.from_vscode").lazy_load()
-- require("luasnip.loaders.from_vscode").lazy_load {
--   paths = vim.fn.stdpath "config" .. "/lua/custom/my-snippets", -- custom snippet taruh di custom/my-snippets
-- }
