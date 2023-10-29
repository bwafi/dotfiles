local options = {
  format = {
    timeout_ms = 3000,
    async = false, -- not recommended to change
    quiet = false, -- not recommended to change
  },

  format_on_save = {
    lsp_fallback = true,
    timeout_ms = 500,
  },

  formatters_by_ft = {
    lua = { "stylua" },
    javascript = { "prettierd" },
    javascriptreact = { "prettierd" },
    typescript = { "prettierd" },
    typescriptreact = { "prettierd" },
    prisma = { "prisma" },
    css = { "prettierd" },
    html = { "prettierd" },
    json = { "prettierd" },
    jsonc = { "prettierd" },
    sh = { "shfmt" },
  },

  formatters = {
    prisma = {
      command = "prisma",
      args = { "format", "$FILENAME" },
      stdin = false,
    },
  },
}

vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function(args)
    require("conform").format { bufnr = args.buf }
  end,
})

require("conform").setup(options)
require("core.utils").load_mappings "conform"
