return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      diagnostics = { virtual_text = true },
      servers = {
        cssls = { settings = { css = { lint = { unknownAtRules = "ignore" } } } }, -- ignore warning tailwind css
        html = {
          filetypes = { "html", "ejs" },
        },
        emmet_ls = {
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
            "ejs",
          },
        },
        volar = {
          autostart = false, -- true if vue project
          filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue", "json" }, -- enable takeover mode for js files - https://github.com/johnsoncodehk/volar/discussions/471
        },
        tsserver = {
          -- Need to disable this cuz `Inline Edit` won't work otherwise
          autostart = true, -- false if vue project
          single_file_support = false,
          settings = {
            typescript = {
              inlayHints = {
                includeInlayParameterNameHints = "literal",
                includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                includeInlayFunctionParameterTypeHints = true,
                includeInlayVariableTypeHints = false,
                includeInlayPropertyDeclarationTypeHints = true,
                includeInlayFunctionLikeReturnTypeHints = true,
                includeInlayEnumMemberValueHints = true,
              },
            },
            javascript = {
              inlayHints = {
                includeInlayParameterNameHints = "all",
                includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                includeInlayFunctionParameterTypeHints = true,
                includeInlayVariableTypeHints = true,
                includeInlayPropertyDeclarationTypeHints = true,
                includeInlayFunctionLikeReturnTypeHints = true,
                includeInlayEnumMemberValueHints = true,
              },
            },
          },
        },
      },
    },
  },
}
