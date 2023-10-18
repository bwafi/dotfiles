-- local autocmd = vim.api.nvim_create_autocmdini

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })
--
-- This file is automatically loaded by plugins.core
local function augroup(name)
  return vim.api.nvim_create_augroup(name, { clear = true })
end
local autocmd = vim.api.nvim_create_autocmd
local opt = vim.opt

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
opt.shortmess:append { W = true, I = true, c = true }
opt.wrap = false
opt.breakindent = true
opt.linebreak = true
opt.breakat = " " -- "^I!@*-+;:,./?"  Default value
opt.list = true -- Show some invisible characters (tabs...
opt.scrolloff = 4 -- Lines of context
opt.confirm = true -- Confirm to save changes before exiting modified buffer
opt.smartcase = true -- Don't ignore case with capitals
opt.relativenumber = true -- Relative line numbers
-- opt.numberwidth = 1
-- opt.smoothscroll = true

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

-- disable fold in buffer/filetypes
autocmd("FileType", {
  pattern = { "nvcheatsheet", "neo-tree", "NvimTree", "nvdash", "dbui" },
  callback = function()
    require("ufo").detach()
    vim.opt_local.foldenable = false
    vim.opt_local.foldcolumn = "0" -- '0' is not bad
    vim.opt_local.signcolumn = "no"
  end,
})

-- snippets
-- local lpath = vim.fn.stdpath "config" .. "/lua/custom/my-snippets"
-- vim.g.vscode_snippets_path = lpath

-- disable mini.cursorword in nvim-tree
autocmd("FileType", {
  pattern = { "NvimTree" },
  callback = function()
    vim.b.minicursorword_disable = true
  end,
})

-- close some filetypes with <q>
autocmd("FileType", {
  group = augroup "close_with_q",
  pattern = {
    "help",
    "lspinfo",
    "man",
    "notify",
    "query",
    "spectre_panel",
    "tsplayground",
    "neotest-*",
    "checkhealth",
    "dbout",
    -- "neotest-summary",
    -- "neotest-output-panel",
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
  end,
})

-- show cursor line only in active window
vim.api.nvim_create_autocmd({ "WinEnter" }, {
  callback = function()
    local ok, cl = pcall(vim.api.nvim_win_get_var, 0, "auto-cursorline")
    if ok and cl then
      vim.wo.cursorline = true
      -- vim.wo.miniindentscope_disable = false
      vim.api.nvim_win_del_var(0, "auto-cursorline")
    end
  end,
})
vim.api.nvim_create_autocmd({ "WinLeave" }, {
  callback = function()
    local cl = vim.wo.cursorline
    if cl then
      vim.api.nvim_win_set_var(0, "auto-cursorline", cl)
      -- vim.wo.miniindentscope_disable = true
      vim.wo.cursorline = false
    end
  end,
})

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
autocmd("TextYankPost", {
  group = augroup "highlight_yank",
  desc = "Hightlight selection on yank",
  pattern = "*",
  callback = function()
    vim.highlight.on_yank()
  end,
})
