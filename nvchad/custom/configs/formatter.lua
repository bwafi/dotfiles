-- local M = {
--   filetype = {
--     javascript = {
--       require("formatter.filetypes.javascript").prettierd,
--     },
--
--     typescript = {
--       require("formatter.filetypes.typescript").prettierd,
--     },
--
--     typescriptreact = {
--       require("formatter.filetypes.typescriptreact").prettierd,
--     },
--
--     javascriptreact = {
--       require("formatter.filetypes.javascriptreact").prettierd,
--     },
--
--     lua = {
--       require("formatter.filetypes.lua").stylua,
--     },
--
--     go = {
--       require("formatter.filetypes.go").goimports,
--     },
--
--     ["*"] = {
--       require("formatter.filetypes.any").remove_trailing_whitespace,
--     },
--   },
-- }
--
-- vim.api.nvim_create_autocmd({ "BufWritePost" }, {
--   command = "FormatWriteLock",
-- })
--
-- return M
