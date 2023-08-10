return {
  {
    { "Shatur/neovim-ayu", priority = 1000 },

    { "ellisonleao/gruvbox.nvim" },

    {
      "Tsuzat/NeoSolarized.nvim",
      opts = {
        transparent = false,
      },
    },

    { "joshdick/onedark.vim" },

    { "drewtempelmeyer/palenight.vim" },
    {
      "folke/tokyonight.nvim",
      -- lazy = false,
      opts = {
        styles = {
          -- Style to be applied to different syntax groups
          -- Value is any valid attr-list value for `:help nvim_set_hl`
          comments = { italic = true },
          keywords = { italic = true },
        },
        on_highlights = function(hl, c)
          hl["@tag.tsx"] = {
            fg = "#ff79c6",
          }
          hl["@tag.javascript"] = {
            fg = "#ff79c6",
          }
          hl["@type.tsx"] = {
            fg = c.yellow,
          }
          hl["@type.javascript"] = {
            fg = c.yellow,
          }
          hl["@variable.tsx"] = {
            fg = c.yellow,
          }
          hl["@variable.javascript"] = {
            fg = c.yellow,
          }
          hl["@lsp.type.variable.typescriptreact"] = {
            fg = "#f1fa8c",
          }
          hl["@lsp.type.variable.javascript"] = {
            fg = "#f1fa8c",
          }
        end,
      },
    },
    { "cesaralvarod/tokyogogh.nvim", lazy = false, priority = 1000 },
    { "marko-cerovac/material.nvim" },
    {
      "olimorris/onedarkpro.nvim",
      priority = 1000, -- Ensure it loads first
    },

    { "rebelot/kanagawa.nvim" },
    { "catppuccin/nvim" },
    { "Alexis12119/nightly.nvim" },

    -- -- Configure LazyVim to load default theme
    {
      "LazyVim/LazyVim",
      opts = {
        colorscheme = "tokyonight-storm",
        -- colorscheme = "onedark",
        -- colorscheme = "palenight",
        -- colorscheme = "catppuccin-mocha",
        -- colorscheme = "nightly",
        -- colorscheme = "kanagawa-wave",
        -- colorscheme = "tokyogogh-storm",
        -- colorscheme = "NeoSolarized",
      },
    },
  },
}
