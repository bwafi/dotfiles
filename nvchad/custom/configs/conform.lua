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
    javascript = { "prettier" },
    javascriptreact = { "prettier" },
    typescript = { "prettier" },
    typescriptreact = { "prettier" },
    prisma = { "prisma" },
    css = { "prettier" },
    html = { "prettier" },
    json = { "prettier" },
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
