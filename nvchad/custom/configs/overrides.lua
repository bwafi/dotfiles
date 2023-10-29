local M = {}

M.treesitter = {
  ensure_installed = {
    "lua",
    "html",
    "css",
    "scss",
    "sql",
    "json",
    "typescript",
    "javascript",
    "tsx",
    "http",
    "vue",
    "go",
    "prisma",
    "php",
    "markdown",
    "markdown_inline",
    "regex",
  },

  indent = {
    enable = true,
    -- disable = {
    --   "python"
    -- },
  },

  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = 1000,
  },
}

M.mason = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    "stylua",

    -- web dev stuff
    "css-lsp",
    "html-lsp",
    "emmet-language-server",
    -- "emmet-ls",
    "typescript-language-server",
    "prettierd",
    "shfmt",
    "tailwindcss-language-server",
    "eslint-lsp",
    "prisma-language-server",
    "json-lsp",
    "js-debug-adapter",
    "vue-language-server",

    -- sql
    "sqlls",
    "sql-formatter",

    -- go
    "gopls",
    "goimports-reviser",
    "golangci-lint",
    "golines",
  },
}

-- git support in nvimtree
M.nvimtree = {
  git = {
    enable = true,
    ignore = false,
  },
  diagnostics = {
    enable = true,
  },
  view = {
    signcolumn = "no",
  },
  renderer = {
    highlight_git = true,
    icons = {
      git_placement = "after",
      show = {
        git = true,
      },
    },
  },
}

-- custom/configs/overrides.lua
M.telescope = {
  defaults = {
    multi_icon = " ",
    selection_caret = "➤ ",
    sorting_strategy = "descending", -- display results top->bottom
    layout_config = {
      horizontal = {
        prompt_position = "bottom",
      },
    },
  },
}

M.cmp = {
  experimental = {
    ghost_text = true,
    hl_group = "CmpGhostText",
  },
}

return M
