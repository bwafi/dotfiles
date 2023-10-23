-- To find any highlight groups: "<cmd> Telescope highlights"
-- Each highlight group can take a table with variables fg, bg, bold, italic, etc
-- base30 variable names can also be used as colors

local M = {}

---@type Base46HLGroupsList
M.override = {
  Comment = {
    italic = true,
  },

  CursorLine = { bg = "black2" },

  -- nvdash highlight
  NvDashAscii = { fg = "pink", bg = "black" },
  NvDashButtons = { bg = "black" },

  --Telescope highlights
  TelescopePromptBorder = { fg = "blue" },
  TelescopeBorder = { fg = "blue" },

  --  fold color
  FoldColumn = { bg = "black", fg = "grey_fg" },
}

---@type HLTable
M.add = {
  NvimTreeOpenedFolderName = { fg = "green", bold = true },

  -- tabline vim-visual_multi
  TabLine = { fg = "white" },

  -- add cursor line fold
  CursorLineFold = { fg = "white" },

  -- highlights under cursor
  MiniCursorWord = { bg = "one_bg3" },
  MiniCursorWordCurrent = { bg = "one_bg3" },

  SagaWinbarSep = { fg = "cyan" },
}

return M
