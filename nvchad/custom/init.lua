-- local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })
--
-- This file is automatically loaded by plugins.core
local opt = vim.opt

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

opt.shortmess:append { W = true, I = true, c = true }
opt.breakindent = true
opt.list = true -- Show some invisible characters (tabs...
opt.scrolloff = 4 -- Lines of context
opt.confirm = true -- Confirm to save changes before exiting modified buffer
opt.smartcase = true -- Don't ignore case with capitals
opt.relativenumber = true -- Relative line numbers
opt.numberwidth = 2
-- opt.signcolumn = "yes"

if vim.fn.has "nvim-0.9.0" == 1 then
  opt.splitkeep = "screen"
  opt.shortmess:append { C = true }
end

-- UFO folding https://github.com/kevinhwang91/nvim-ufo#minimal-configuration
vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
vim.o.foldcolumn = "1" -- '0' is not bad
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true

-- snippets
local lpath = vim.fn.stdpath "config" .. "/lua/custom/my-snippets"
vim.g.vscode_snippets_path = lpath
vim.g.snipmate_snippets_path = lpath

-- disable mini.cursorword in nvim-tree
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "NvimTree" },
  callback = function()
    vim.b.minicursorword_disable = true
  end,
})

-- quit toggle neotest
local group = vim.api.nvim_create_augroup("NeotestConfig", {})
for _, ft in ipairs { "output", "attach", "summary" } do
  vim.api.nvim_create_autocmd("FileType", {
    pattern = "neotest-" .. ft,
    group = group,
    callback = function(opts)
      vim.keymap.set("n", "q", function()
        pcall(vim.api.nvim_win_close, 0, true)
      end, {
        buffer = opts.buf,
      })
    end,
  })
end

-- neotest diagnostic
local neotest_ns = vim.api.nvim_create_namespace "neotest"
vim.diagnostic.config({
  virtual_text = {
    format = function(diagnostic)
      -- Replace newline and tab characters with space for more compact diagnostics
      local message = diagnostic.message:gsub("\n", " "):gsub("\t", " "):gsub("%s+", " "):gsub("^%s+", "")
      return message
    end,
  },
}, neotest_ns)

-- highlight yank
vim.api.nvim_create_autocmd("TextYankPost", {
  group = vim.api.nvim_create_augroup("highlight_yank", {}),
  desc = "Hightlight selection on yank",
  pattern = "*",
  callback = function()
    vim.highlight.on_yank { higroup = "IncSearch", timeout = 150 }
    -- vim.highlight.on_yank { higroup = "MatchParen", timeout = 150 }
  end,
})
