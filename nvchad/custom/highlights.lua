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

  --Telescope highlights
  TelescopePromptBorder = { fg = "one_bg3" },
  TelescopeBorder = { fg = "one_bg3" },

  -- blank line highlights
  IndentBlanklineContextChar = { fg = "cyan" },
  FoldColumn = { bg = "black" },
}

---@type HLTable
M.add = {
  NvimTreeOpenedFolderName = { fg = "green", bold = true },

  -- highlights under cursor
  MiniCursorWord = { bg = "one_bg3" },
  MiniCursorWordCurrent = { bg = "one_bg3" },
}

return M
