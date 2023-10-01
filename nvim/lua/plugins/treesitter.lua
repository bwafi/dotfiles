return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = {
    "windwp/nvim-ts-autotag",
    "JoosepAlviste/nvim-ts-context-commentstring",
    { "tree-sitter/tree-sitter-embedded-template", ft = "embedded_template" },
  },

  opts = {
    indent = {
      enable = true,
    },

    autotag = {
      -- Setup autotag using treesitter config.
      enable = true,
      enable_rename = true,
      enable_close = true,
      enable_close_on_slash = false,
    },

    rainbow = {
      enable = true,
      extended_mode = true,
      max_file_lines = 1000,
    },

    context_commentstring = {
      enable = true,
      enable_autocmd = false,
    },

    ensure_installed = {
      "bash",
      -- "c",
      "css",
      "scss",
      "go",
      "php",
      "embedded_template",
      "sql",
      "html",
      "javascript",
      "jsdoc",
      "jsonc",
      "json",
      "lua",
      "luadoc",
      "luap",
      "markdown",
      "markdown_inline",
      "python",
      "query",
      "regex",
      "tsx",
      "typescript",
      "vim",
      "vimdoc",
      "vue",
      "yaml",
    },
  },
}
