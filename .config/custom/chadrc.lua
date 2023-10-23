---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require "custom.highlights"

M.ui = {
  theme = "tokyonight",
  theme_toggle = { "tokyonight", "one_light" },
  hl_override = highlights.override,
  hl_add = highlights.add,
  lsp_semantic_tokens = false, -- needs nvim v1.9, just adds highlight groups for lsp semantic tokens
  extended_integrations = { "notify", "lspsaga", "trouble", "dap", "rainbowdelimiters", "todo" }, -- these aren't compiled by default, ex: "alpha", "notify"

  -- nvdash (dashboard)
  nvdash = {
    load_on_startup = true,

    header = {
      "▄▄▄▄·  ▄▄▄· ▄▄▌ ▐ ▄▌ ▄▄▄· ·▄▄▄▪  ",
      "▐█ ▀█▪▐█ ▀█ ██· █▌▐█▐█ ▀█ ▐▄▄·██ ",
      "▐█▀▀█▄▄█▀▀█ ██▪▐█▐▐▌▄█▀▀█ ██▪ ▐█·",
      "██▄▪▐█▐█ ▪▐▌▐█▌██▐█▌▐█ ▪▐▌██▌.▐█▌",
      "·▀▀▀▀  ▀  ▀  ▀▀▀▀ ▀▪ ▀  ▀ ▀▀▀ ▀▀▀",
    },
  },

  -- transparency = true,

  statusline = {
    theme = "minimal", -- default/vscode/vscode_colored/minimal

    -- default/round/block/arrow (separators work only for "default" statusline theme;
    -- round and block will work for the minimal theme only)
    separator_style = "arrow",
    overriden_modules = nil,
  },

  tabufline = {
    -- remove buttons and padding
    overriden_modules = function(modules)
      table.remove(modules, #modules)
      -- table.remove(modules, 1)
    end,
  },

  telescope = {
    style = "bordered", -- bordered or borderless
  },

  cmp = {
    icons = true,
    lspkind_text = true,
    style = "flat_light", -- default/flat_light/flat_dark/atom/atom_colored
    border_color = "grey_fg", -- only applicable for "default" style, use color names from base30 variables
    selected_item_bg = "colored", -- colored / simple
  },

  lsp = {
    signature = {
      disabled = true, -- use noice nvim
    },
  },
}

M.plugins = "custom.plugins"
-- check core.mappings for table structure
M.mappings = require "custom.mappings"

return M
