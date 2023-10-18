local typescript_tools = require "typescript-tools"
local on_attach = require("plugins.configs.lspconfig").on_attach

local handlers = {
  ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "rounded",
    title = "Hover",
    silent = true,
  }),

  ["textDocument/signatureHelp"] = require "noice",
  -- ["textDocument/publishDiagnostics"] = vim.lsp.with(
  -- 	vim.lsp.diagnostic.on_publish_diagnostics,
  -- 	{ virtual_text = EcoVim.lsp.virtual_text } -- boolean variable true/false
  -- ),
  -- ["textDocument/definition"] = function(err, result, method, ...)
  -- 	if vim.tbl_islist(result) and #result > 1 then
  -- 		local filtered_result = filter(result, filterReactDTS)
  -- 		return vim.lsp.handlers["textDocument/definition"](err, filtered_result, method, ...)
  -- 	end
  --
  -- 	vim.lsp.handlers["textDocument/definition"](err, result, method, ...)
  -- end,
}

typescript_tools.setup {
  on_attach = on_attach,
  handlers = handlers,

  settings = {
    tsserver_path = vim.env.HOME .. "/.volta/tools/shared/typescript/lib/tsserver.js",
    complete_function_calls = true,
  },
}
