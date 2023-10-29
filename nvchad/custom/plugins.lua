local overrides = require "custom.configs.overrides"

---@type NvPluginSpec[]
local plugins = {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      -- {
      --   "nvimtools/none-ls.nvim",
      --   config = function()
      --     require "custom.configs.null-ls"
      --   end,
      -- },
      { "b0o/schemastore.nvim" },
      { "folke/neodev.nvim" },
      { "nvim-lua/plenary.nvim" },
      {
        "pmizio/typescript-tools.nvim",
        config = function()
          require "custom.configs.typescript-tools"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },

  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      "windwp/nvim-ts-autotag",
      "hiphish/rainbow-delimiters.nvim",
      -- "nvim-treesitter/nvim-treesitter-textobjects",
    },
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  {
    "nvim-telescope/telescope.nvim",
    opts = overrides.telescope,
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    opts = {
      show_trailing_blankline_indent = false,
      show_first_indent_level = true,
      show_current_context = false,
      show_current_context_start = true,
    },
  },

  {
    "hrsh7th/nvim-cmp",
    opts = overrides.cmp,
    dependencies = {
      {
        -- snippet plugin
        "L3MON4D3/LuaSnip",
        config = function()
          require "custom.configs.luasnip"
        end,
      },
      {
        "windwp/nvim-autopairs",
        config = function()
          require "custom.configs.autopairs"
        end,
      },
    },
  },

  {
    "folke/which-key.nvim",
    config = function()
      require("which-key").register {
        ["<leader>"] = {
          d = {
            name = "+Debug",
          },
          f = {
            name = "+Find",
          },
          u = {
            name = "+Ui",
          },
          t = {
            name = "+Test",
          },
        },
      }
    end,
  },

  -- Install a plugin

  -- esc with jj or jk
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  --linting
  {
    "mfussenegger/nvim-lint",
    events = { "BufWritePost", "BufReadPost", "InsertLeave" }, -- event = "VeryLazy",
    config = function()
      require "custom.configs.lint"
    end,
  },

  -- dressing
  {
    "stevearc/dressing.nvim",
    event = "VeryLazy",
    init = function()
      vim.ui.select = function(...)
        require("lazy").load { plugins = { "dressing.nvim" } }
        return vim.ui.select(...)
      end
      vim.ui.input = function(...)
        require("lazy").load { plugins = { "dressing.nvim" } }
        return vim.ui.input(...)
      end
    end,
  },

  -- noice nvim
  {
    "folke/noice.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
      {
        "rcarriga/nvim-notify",
        opts = {
          -- render = "wrapped-compact",
          -- top_down = false,
          max_width = 55,
          minimum_width = 15,
          level = vim.log.levels.TRACE, -- minimum severity level
          timeout = 4000,
          stages = "slide", -- slide|fade
        },
      },
    },
    event = "BufWinEnter",
    config = function()
      require "custom.configs.noice"
      require("core.utils").load_mappings "noice"
    end,
  },

  -- debugging
  {
    "rcarriga/nvim-dap-ui",
    event = "VeryLazy",
    dependencies = {
      {
        "mfussenegger/nvim-dap",
        config = function()
          require "custom.configs.dapui"
        end,
      },
      {
        "theHamsta/nvim-dap-virtual-text",
        opts = {},
      },
    },
    config = function()
      require "custom.configs.dapui"
    end,
  },

  {
    "mfussenegger/nvim-dap",
    config = function()
      require "custom.configs.dap"
      require("core.utils").load_mappings "dap"
    end,
  },

  {
    "leoluz/nvim-dap-go",
    ft = "go",
    dependencies = "mfussenegger/nvim-dap",
    config = function(_, opts)
      require("dap-go").setup(opts)
      require("core.utils").load_mappings "dap_go"
    end,
  },

  -- cmp cmd-line
  {
    "hrsh7th/cmp-cmdline",
    event = "VeryLazy",
    config = function()
      require "custom.configs.cmp-cmdline"
    end,
  },

  -- bracket rainbow
  {
    "hiphish/rainbow-delimiters.nvim",
    config = function()
      require "custom.configs.rainbow-delimiters"
    end,
  },

  -- oil nvim
  {
    "stevearc/oil.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    init = function()
      require "custom.configs.oil"
    end,
  },

  -- vim visual multi
  {
    "mg979/vim-visual-multi",
    branch = "master",
    event = "InsertEnter",
    init = function()
      -- theme : codedark, iceblue, purplegray, spacegray, ocean, nord, neon, papper
      vim.g.VM_theme = "iceblue"
    end,
  },

  -- trouble nvim
  {
    "folke/trouble.nvim",
    cmd = { "TroubleToggle", "Trouble" },
    init = function()
      require("trouble").setup {
        use_diagnostic_signs = true,
      }
      require("core.utils").load_mappings "trouble"
    end,
  },

  -- nvim surround
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup {}
    end,
  },

  -- highlight under cursor
  {
    "echasnovski/mini.cursorword",
    init = function()
      require("mini.cursorword").setup {
        -- delay = 100,
      }
    end,
  },

  -- neotest
  {
    "nvim-neotest/neotest",
    event = "LspAttach",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "haydenmeade/neotest-jest",
      "marilari88/neotest-vitest",
      "nvim-neotest/neotest-go",
    },
    config = function()
      require "custom.configs.neotest"
    end,
    init = function(_)
      require("core.utils").load_mappings "neotest"
    end,
  },

  -- folded ui
  {
    "kevinhwang91/nvim-ufo",
    event = "VimEnter",
    -- event = "BufReadPost",
    dependencies = {
      "kevinhwang91/promise-async",
      {
        "luukvbaal/statuscol.nvim",
        config = function()
          require("custom.configs.ufo").statuscol()
        end,
      },
    },
    config = function()
      require("custom.configs.ufo").ufo()
      require("core.utils").load_mappings "ufo"
    end,
  },

  -- mini animate
  {
    "echasnovski/mini.animate",
    event = "VeryLazy",
    config = function()
      require "custom.configs.mini-animate"
    end,
  },

  -- rest nvim http
  {
    "rest-nvim/rest.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require "custom.configs.rest"
      -- keys mappings
    end,
  },

  -- undotree
  {
    "mbbill/undotree",
    cmd = "UndotreeToggle",
    keys = {
      { "<leader>fu", "<cmd>UndotreeToggle<cr>", desc = "Undo tree" },
    },
  },

  -- todo
  {
    "folke/todo-comments.nvim",
    cmd = { "TodoTrouble", "TodoTelescope" },
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = true,
  -- stylua: ignore
    keys = {
    { "]t", function() require("todo-comments").jump_next() end, desc = "Next todo comment" },
    { "[t", function() require("todo-comments").jump_prev() end, desc = "Previous todo comment" },
    { "<leader>xt", "<cmd>TodoTrouble<cr>", desc = "Todo (Trouble)" },
    { "<leader>xT", "<cmd>TodoTrouble keywords=TODO,FIX,FIXME<cr>", desc = "Todo/Fix/Fixme (Trouble)" },
    { "<leader>st", "<cmd>TodoTelescope<cr>", desc = "Todo" },
    { "<leader>sT", "<cmd>TodoTelescope keywords=TODO,FIX,FIXME<cr>", desc = "Todo/Fix/Fixme" },
  },
  },

  -- flash jump
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {},
  -- stylua: ignore
  keys = {
    { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
    { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
    { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
    { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
    { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
  },
  },

  --markdown preview
  {
    "iamcco/markdown-preview.nvim",
    ft = { "markdown" },
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
    keys = {
      { "<C-p>", "<Plug>MarkdownPreviewToggle", desc = "Toggle markdown preview" },
    },
  },

  {
    "echasnovski/mini.indentscope",
    version = false, -- wait till new 0.7.0 release to put it back on semver
    event = "VeryLazy",
    init = function()
      require "custom.configs.mini-indentscope"
    end,
  },

  -- formatting with conform
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    lazy = true,
    cmd = { "ConformInfo" },
    init = function()
      require "custom.configs.conform"
    end,
  },

  -- winbar barbecue
  {
    "utilyre/barbecue.nvim",
    name = "barbecue",
    lazy = false,
    version = "*",
    dependencies = {
      "SmiteshP/nvim-navic",
    },
    config = function()
      require "custom.configs.barbecue"
    end,
  },

  -- To make a plugin not be loaded
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   enabled = false
  -- },

  -- All NvChad plugins are lazy-loaded by default
  -- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
  -- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
  -- {
  --   "mg979/vim-visual-multi",
  --   lazy = false,
  -- }
}

return plugins
