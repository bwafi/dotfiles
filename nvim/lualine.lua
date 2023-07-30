return {
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function(_, opts)
      local icons = require("lazyvim.config").icons
      local Util = require("lazyvim.util")
      opts.sections.lualine_c = {
        { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
        { "filename", path = 1, symbols = { modified = "  ", readonly = "", unnamed = "" } },
        -- stylua: ignore
        -- {
        --   function() return require("nvim-navic").get_location() end,
        --   cond = function() return package.loaded["nvim-navic"] and require("nvim-navic").is_available() end,
        -- },
      }
      opts.sections.lualine_x = {
        -- {
        --   function()
        --     return require("noice").api.status.command.get()
        --   end,
        --   cond = function()
        --     return package.loaded["noice"] and require("noice").api.status.command.has()
        --   end,
        --   color = Util.fg("Statement"),
        -- },
          -- stylua: ignore
        {
          function() return require("noice").api.status.mode.get() end,
          cond = function() return package.loaded["noice"] and require("noice").api.status.mode.has() end,
          color = Util.fg("Constant"),
        },
          -- stylua: ignore
        {
          function() return "  " .. require("dap").status() end,
          cond = function () return package.loaded["dap"] and require("dap").status() ~= "" end,
          color = Util.fg("Debug"),
        },
        { require("lazy.status").updates, cond = require("lazy.status").has_updates, color = Util.fg("Special") },
        {
          "diff",
          symbols = {
            added = icons.git.added,
            modified = icons.git.modified,
            removed = icons.git.removed,
          },
        },
      }

      opts.sections.lualine_y = {
        {
          function()
            return require("noice").api.status.command.get()
          end,
          cond = function()
            return package.loaded["noice"] and require("noice").api.status.command.has()
          end,
          color = Util.fg("Statement"),
        },
        { "progress", separator = " ", padding = { left = 1, right = 0 } },
        { "location", padding = { left = 0, right = 1 } },
      }

      opts.sections.lualine_z = {
        function()
          return " " .. os.date("%I:%M %p")
        end,
      }
    end,
  },
}
