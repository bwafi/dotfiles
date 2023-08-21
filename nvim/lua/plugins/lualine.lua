return {
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function()
      local icons = require("lazyvim.config").icons
      local Util = require("lazyvim.util")
      local colors = {
        bg = "#1F2335",
        fg = "#bbc2cf",
        yellow = "#ECBE7B",
        cyan = "#008080",
        darkblue = "#081633",
        green = "#98be65",
        orange = "#FF8800",
        violet = "#a9a1e1",
        magenta = "#c678dd",
        blue = "#51afef",
        red = "#ec5f67",
      }

      local conditions = {
        buffer_not_empty = function()
          return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
        end,
        hide_in_width = function()
          return vim.fn.winwidth(0) > 80
        end,
        check_git_workspace = function()
          local filepath = vim.fn.expand("%:p:h")
          local gitdir = vim.fn.finddir(".git", filepath .. ";")
          return gitdir and #gitdir > 0 and #gitdir < #filepath
        end,
      }

      local config = {
        options = {
          theme = {
            -- We are going to use lualine_c an lualine_x as left and
            -- right section. Both are highlighted by c theme .  So we
            -- are just setting default looks o statusline
            normal = { c = { fg = colors.fg, bg = colors.bg } },
            inactive = { c = { fg = colors.fg, bg = colors.bg } },
          },
          section_separators = "",
          component_separators = "",
          globalstatus = true,
          disabled_filetypes = { statusline = { "dashboard", "alpha", "toggleterm" } },
        },
        sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = {},
          lualine_x = {},
          lualine_y = {},
          lualine_z = {},
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = {},
          lualine_x = {},
          lualine_y = {},
          lualine_z = {},
        },
      }

      -- Inserts a component in lualine_c at left section
      local function ins_left(component)
        table.insert(config.sections.lualine_c, component)
      end

      -- Inserts a component in lualine_x at right section
      local function ins_right(component)
        table.insert(config.sections.lualine_x, component)
      end

      ins_left({
        function()
          return "▊"
        end,
        color = { fg = colors.blue },
        padding = { left = 0, right = 1 },
      })

      ins_left({
        function()
          return ""
        end,
        color = function()
          local mode_color = {
            n = colors.red,
            i = colors.green,
            v = colors.blue,
            [""] = colors.blue,
            V = colors.blue,
            c = colors.magenta,
            no = colors.red,
            s = colors.orange,
            S = colors.orange,
            [""] = colors.orange,
            ic = colors.yellow,
            R = colors.violet,
            Rv = colors.violet,
            cv = colors.red,
            ce = colors.red,
            r = colors.cyan,
            rm = colors.cyan,
            ["r?"] = colors.cyan,
            ["!"] = colors.red,
            t = colors.red,
          }
          return { fg = mode_color[vim.fn.mode()] }
        end,
        padding = { right = 1 },
      })
      --
      -- ins_left({
      --   "filesize",
      --   cond = conditions.buffer_not_empty,
      -- })

      ins_left({
        -- "filename",
        -- cond = conditions.buffer_not_empty,
        -- color = { fg = colors.magenta, gui = "none" },
        "filename",
        path = 1,
        symbols = { modified = "  ", readonly = "", unnamed = "" },
        padding = { right = 1, left = 1 },
      })

      ins_left({ "location", padding = { right = 1 } })

      ins_left({ "progress", color = { fg = colors.fg, gui = "none" }, padding = { right = 1 } })

      ins_left({
        "diagnostics",
        symbols = {
          error = icons.diagnostics.Error,
          warn = icons.diagnostics.Warn,
          info = icons.diagnostics.Info,
          hint = icons.diagnostics.Hint,
        },
      })

      -- ins_left({
      --   function()
      --     return "%="
      --   end,
      -- })
      --
      -- ins_left({
      --   function()
      --     local msg = "No Active Lsp"
      --     local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
      --     local clients = vim.lsp.get_active_clients()
      --     if next(clients) == nil then
      --       return msg
      --     end
      --     for _, client in ipairs(clients) do
      --       local filetypes = client.config.filetypes
      --       if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
      --         return client.name
      --       end
      --     end
      --     return msg
      --   end,
      --   icon = " LSP:",
      --   color = { fg = "#ffffff", gui = "none" },
      -- })

      ins_right({
        "o:encoding",
        -- fmt = string.upper,  --uppercase
        cond = conditions.hide_in_width,
        color = { fg = colors.green, gui = "none" },
        padding = { right = 0 },
      })

      ins_right({
        "branch",
        icon = "",
        color = { fg = colors.violet, gui = "none" },
        padding = { left = 1 },
      })

      ins_right({
        "diff",
        symbols = {
          added = icons.git.added,
          modified = icons.git.modified,
          removed = icons.git.removed,
        },
        padding = { left = 1 },
      })

      ins_right({
        function()
          return require("noice").api.status.command.get()
        end,
        cond = function()
          return package.loaded["noice"] and require("noice").api.status.command.has()
        end,
        color = Util.fg("Statement"), -- color = { fg = colors.blue },
        padding = { left = 1 },
      })

      ins_right({
        "fileformat",
        fmt = string.upper,
        icon_only = true,
        color = { fg = colors.green, gui = "none" },
        padding = { left = 1, right = 0 },
      })

      -- ins_right({
      --   function()
      --     return " " .. os.date("%I:%M %p")
      --   end,
      --   padding = { left = 1 },
      -- })
      --
      ins_right({
        function()
          return "▊"
        end,
        color = { fg = colors.blue },
        padding = { left = 1 },
      })

      return config
    end,
  },
}
