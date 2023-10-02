local M = {}

M.statuscol = function()
  local builtin = require "statuscol.builtin"
  require("statuscol").setup {
    relculright = true,
    -- segments = {
    --   { text = { builtin.foldfunc }, click = "v:lua.ScFa" },
    --   { text = { "%s" }, click = "v:lua.ScSa" },
    --   { text = { builtin.lnumfunc, " " }, click = "v:lua.ScLa" },
    -- },

    -- fold column https://github.com/neovim/neovim/pull/17446#issuecomment-1407651883
     segments = {
    { text = { "%s" }, click = "v:lua.ScSa" },
    { text = { builtin.lnumfunc }, click = "v:lua.ScLa", },
    {
      text = { " ", builtin.foldfunc, " " },
      condition = { builtin.not_empty, true, builtin.not_empty },
      click = "v:lua.ScFa"
    },
    }
  }
end

M.ufo = function()
  -- https://github.com/kevinhwang91/nvim-ufo/issues/4#issuecomment-1514537245
  local handler = function(virtText, lnum, endLnum, width, truncate)
    local newVirtText = {}
    local totalLines = vim.api.nvim_buf_line_count(0)
    local foldedLines = endLnum - lnum
    local suffix = ("   %d %d%%"):format(foldedLines, foldedLines / totalLines * 100)
    local sufWidth = vim.fn.strdisplaywidth(suffix)
    local targetWidth = width - sufWidth
    local curWidth = 0
    for _, chunk in ipairs(virtText) do
      local chunkText = chunk[1]
      local chunkWidth = vim.fn.strdisplaywidth(chunkText)
      if targetWidth > curWidth + chunkWidth then
        table.insert(newVirtText, chunk)
      else
        chunkText = truncate(chunkText, targetWidth - curWidth)
        local hlGroup = chunk[2]
        table.insert(newVirtText, { chunkText, hlGroup })
        chunkWidth = vim.fn.strdisplaywidth(chunkText)
      end
      curWidth = curWidth + chunkWidth
    end
    local rAlignAppndx = math.max(width - 5 - curWidth - sufWidth, 0)
    suffix = " ⋯  " .. (" "):rep(rAlignAppndx) .. suffix
    table.insert(newVirtText, { suffix, "MoreMsg" })
    return newVirtText
  end

  -- ufo opts
  require("ufo").setup {
    -- fold tesxt custom
    fold_virt_text_handler = handler,

    close_fold_kinds = { "imports" },
    provider_selector = function()
      return { "treesitter", "indent" }
    end,
  }
end

return M
