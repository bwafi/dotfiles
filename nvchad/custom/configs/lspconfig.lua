local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

-- ufo fold https://github.com/kevinhwang91/nvim-ufo/issues/154#issuecomment-1701295317
-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities = require("plugins.configs.lspconfig").capabilities
-- -- capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.foldingRange = {
  dynamicRegistration = false,
  lineFoldingOnly = true,
}

local lspconfig = require "lspconfig"

-- if you just want default config for the servers then put them in a table
-- local servers = { "html", "tsserver", "cssls", "gopls", "volar", "tailwindcss", "prismals", "sqlls" }
local servers = { "html", "cssls", "gopls", "volar", "prismals", "sqlls" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

lspconfig.cssls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    { settings = { css = { lint = { unknownAtRules = "ignore" } } } }, -- ignore warning tailwind global.css
  },
}

-- emmet Html
lspconfig.emmet_language_server.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {
    "css",
    "eruby",
    "html",
    "javascript",
    "javascriptreact",
    "less",
    "sass",
    "scss",
    "svelte",
    "pug",
    "typescriptreact",
    "vue",
  },
  -- Read more about this options in the [vscode docs](https://code.visualstudio.com/docs/editor/emmet#_emmet-configuration).
  -- **Note:** only the options listed in the table are supported.
  init_options = {},
}

-- json
lspconfig.jsonls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    json = {
      schemas = require("schemastore").json.schemas(),
      validate = { enable = true },
    },
  },
}

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = "rounded",
  title = "Hover",
  silent = true,
})

vim.lsp.handlers["textDocument/signatureHelp"] = require "noice"
-- lspconfig.pyright.setup { blabla}
