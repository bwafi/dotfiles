-- To find any highlight groups: "<cmd> Telescope highlights"
-- Each highlight group can take a table with variables fg, bg, bold, italic, etc
-- base30 variable names can also be used as colors

local M = {}

---@type Base46HLGroupsList
M.override = {
  Comment = {
    italic = true,
  },

  --Telescope highlights
  TelescopePromptBorder = { fg = "one_bg3" },
  TelescopeBorder = { fg = "one_bg3" },

  CursorLine = { bg = "black2" },

  -- blank line highlights
  IndentBlanklineContextChar = { fg = "cyan" },
}

---@type HLTable
M.add = {
  NvimTreeOpenedFolderName = { fg = "green", bold = true },

  -- highlights under cursor
  MiniCursorWord = { bg = "one_bg3" },
  MiniCursorWordCurrent = { bg = "one_bg3" },
}

return M
