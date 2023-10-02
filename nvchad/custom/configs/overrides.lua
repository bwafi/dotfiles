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
    "vue",
    "go",
    "php",
    "markdown",
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

  textobjects = {
    select = {
      enable = true,
      lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ["aa"] = "@parameter.outer",
        ["ia"] = "@parameter.inner",
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
        ["ii"] = "@conditional.inner",
        ["ai"] = "@conditional.outer",
        ["il"] = "@loop.inner",
        ["al"] = "@loop.outer",
        ["at"] = "@comment.outer",
        ["ab"] = "@block.inner",
        ["ib"] = "@block.outer",
        ["is"] = "@scopename.inner",
      },
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        ["]m"] = "@function.outer",
        ["]]"] = "@class.outer",
      },
      goto_next_end = {
        ["]M"] = "@function.outer",
        ["]["] = "@class.outer",
      },
      goto_previous_start = {
        ["[m"] = "@function.outer",
        ["[["] = "@class.outer",
      },
      goto_previous_end = {
        ["[M"] = "@function.outer",
        ["[]"] = "@class.outer",
      },
      -- goto_next = {
      --   [']i'] = "@conditional.inner",
      -- },
      -- goto_previous = {
      --   ['[i'] = "@conditional.inner",
      -- }
    },
    swap = {
      enable = true,
      swap_next = {
        ["<leader>a"] = "@parameter.inner",
      },
      swap_previous = {
        ["<leader>A"] = "@parameter.inner",
      },
    },
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
    "emmet-ls",
    "typescript-language-server",
    "prettierd",
    "tailwindcss-language-server",
    "eslint-lsp",
    "shfmt",
    "json-lsp",
    "js-debug-adapter",
    "vue-language-server",

    -- go
    "gopls",
    "gofumpt",
    "goimports",
    "delve",
    "golangci-lint",
    "goimports-revise",
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

M.blankline = {
  show_trailing_blankline_indent = false,
  show_first_indent_level = true,
  show_current_context = true,
  show_current_context_start = false,
  -- use_treesitter = true,
  context_patterns = {
    "class",
    "return",
    "function",
    "method",
    "^if",
    "^while",
    "jsx_element",
    "^for",
    "^object",
    "^array",
    "^table",
    "block",
    "arguments",
    "if_statement",
    "else_clause",
    "jsx_element",
    "jsx_self_closing_element",
    "try_statement",
    "catch_clause",
    "import_statement",
  },
}

M.cmp = {
  experimental = {
    ghost_text = true,
    hl_group = "CmpGhostText",
  },
}

return M
