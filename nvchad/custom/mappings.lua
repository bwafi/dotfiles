local M = {}

M.disabled = {
  n = {
    -- ["<leader>ff"] = ""
    ["<leader>x"] = "",
    ["<leader>q"] = "",
    ["<leader>cm"] = "",
    ["<leader>th"] = "",
    ["<leader>b"] = "", -- disable new buffer
    ["<C-n>"] = "", -- disable nvimtree
    ["<leader>ma"] = "",
  },
}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    -- lazy
    ["<leader>l"] = { "<cmd>Lazy<cr>", "Lazy" },

    -- Mason
    ["<leader>cm"] = { "<cmd>Mason<cr>", "Mason" },

    -- move line
    ["<A-j>"] = { "<cmd>m .+1<cr>==", "Move down" },
    ["<A-k>"] = { "<cmd>m .-2<cr>==", "Move up" },

    -- windows
    ["<leader>|"] = { "<C-W>v", "Split  window right" },
    ["<leader>-"] = { "<C-W>s", "Split  window left" },
    ["<leader>wd"] = { "<C-W>c", "Delete window" },

    -- move Cursor windows
    ["<C-h>"] = { "<C-W>h", "Go to left window" },
    ["<C-j>"] = { "<C-W>j", "Go to lower window" },
    ["<C-k>"] = { "<C-W>k", "Go to upper window" },
    ["<C-l>"] = { "<C-W>l", "Go to right window" },

    -- Oil nvim
    ["-"] = { "<CMD>Oil<CR>", "Open parent directory" },

    -- word wrap
    ["<leader>uw"] = {
      "<CMD>set wrap!<CR>",
      "Toggle word wrap",
      opts = { silent = true, noremap = true, nowait = true },
    },

    -- ["<leader>r"]
    -- duplicate line
    ["gm"] = { "<CMD>copy.<CR>" },
  },

  i = {
    -- save file
    ["<C-s>"] = { "<cmd>w<cr><esc>", "Save file" },

    -- move line
    ["<A-j>"] = { "<esc><cmd>m .+1<cr>==gi", "Move down" },
    ["<A-k>"] = { "<esc><cmd>m .-2<cr>==gi", "Move up" },
  },

  v = {
    -- save file
    ["<C-s>"] = { "<cmd>w<CR>", "Save file" },

    -- move line
    ["<A-j>"] = { ":m '>+1<cr>gv=gv", "Move down" },
    ["<A-k>"] = { ":m '<-2<cr>gv=gv", "Move up" },

    -- duplicate line
    ["gm"] = { ":copy.-1<Cr>gv" },
  },
}

M.tabufline = {
  plugin = true,

  n = {
    -- close buffer + hide terminal buffer
    ["<leader>q"] = {
      function()
        require("nvchad.tabufline").close_buffer()
      end,
      "Closebuffer",
    },
    ["<leader>bw"] = {
      function()
        require("nvchad.tabufline").closeAllBufs()
      end,
      "Close All buffer",
    },
  },
}

M.telescope = {
  plugin = true,
  n = {
    ["<leader><space>"] = { "<cmd> Telescope find_files <CR>", "Find files" },
    ["<leader>gm"] = { "<cmd> Telescope git_commits <CR>", "Git commits" },
    ["<leader>fk"] = { "<cmd>Telescope keymaps<cr>", "Key maps" },
    ["<leader>fd"] = { "<cmd>Telescope diagnostics bufnr=0<cr>", "Document Diagnostics" },
    ["<leader>fD"] = { "<cmd>Telescope diagnostics<cr>", "Workspace Diagnostics" },
    ["<leader>fg"] = { "<cmd>Telescope grep_string<cr>", "String" },
    ["<leader>fh"] = { "<cmd>Telescope highlights<cr>", "Search highlights" },
    ["<leader>fs"] = { "<cmd>lsp_document_symbols<cr>", "Goto Symbol" },
    ["<leader>fS"] = { "<cmd>lsp_dynamic_workspace_symbols<cr>", "Goto Symbol (Workspace)" },
    ["<leader>ut"] = { "<cmd> Telescope themes <CR>", "Nvchad themes" },
    ["<leader>fc"] = { "<cmd> Telescope marks <CR>", "telescope bookmarks" },
    ["<leader>pp"] = {
      function()
        require("telescope").extensions.yank_history.yank_history {}
      end,
      "Open Yank History",
    },
  },
}

M.nvimtree = {
  plugin = true,

  n = {
    -- toggle
    ["<leader>e"] = { "<cmd>NvimTreeToggle<CR>", "Toggle nvimtree" },

    -- focus
    -- ["<C-h>"] = { "<cmd>NvimTreeFocus<CR>", "Focus nvimtree" },
  },
}

M.dap = {
  plugin = true,

  n = {
    ["<leader>db"] = {
      function()
        require("dap").toggle_breakpoint()
      end,
      "Add breakpoint at line",
    },
    ["<leader>du"] = {
      function()
        require("dapui").toggle {}
      end,
      "Dap UI",
    },
    ["<leader>de"] = {
      function()
        require("dapui").eval()
      end,
      "Eval",
    },
    ["<leader>dw"] = {
      function()
        require("dap.ui.widgets").hover()
      end,
      "Widgets",
    },
    ["<leader>dc"] = {
      function()
        require("dap").continue()
      end,
      "Continue",
    },
    ["<leader>dj"] = {
      function()
        require("dap").down()
      end,
      "Down",
    },
    ["<leader>dk"] = {
      function()
        require("dap").up()
      end,
      "Up",
    },
    ["<leader>dp"] = {
      function()
        require("dap").pause()
      end,
      "Pause",
    },
    ["<leader>ds"] = {
      function()
        require("dap").session()
      end,
      "Session",
    },
    ["<leader>dt"] = {
      function()
        require("dap").terminate()
      end,
      "Terminate",
    },
    ["<leader>dC"] = {
      function()
        require("dap").run_to_cursor()
      end,
      "Run to Cursor",
    },
    ["<leader>dr"] = {
      function()
        require("dap").repl.toggle()
      end,
      "Toggle REPL",
    },
  },

  v = {
    ["<leader>de"] = {
      function()
        require("dapui").eval()
      end,
      "Eval",
    },
  },
}

M.dap_go = {
  plugin = true,
  n = {
    ["<leader>dgt"] = {
      function()
        require("dap-go").debug_test()
      end,
      "Debug go test",
    },
    ["<leader>dgl"] = {
      function()
        require("dap-go").debug_last_test()
      end,
      "Debug last go test",
    },
  },
}

M.neotest = {
  plugin = true,
  n = {
    ["<leader>tt"] = {
      function()
        require("neotest").run.run(vim.fn.expand "%")
      end,
      "Run File",
    },
    ["<leader>tT"] = {
      function()
        require("neotest").run.run(vim.loop.cwd())
      end,
      "Run All Test Files",
    },
    ["<leader>tr"] = {
      function()
        require("neotest").run.run()
      end,
      "Run Nearest",
    },
    ["<leader>ts"] = {
      function()
        require("neotest").summary.toggle()
      end,
      "Toggle summary",
    },
    ["<leader>to"] = {
      function()
        require("neotest").output.open { enter = true, auto_close = true }
      end,
      "Show Output",
    },
    ["<leader>tO"] = {
      function()
        require("neotest").output_panel.toggle()
      end,
      "Toggle Output Panel",
    },
    ["<leader>tS"] = {
      function()
        require("neotest").run.stop()
      end,
      "Stop",
    },
  },
}

M.noice = {
  plugin = true,

  n = {
    ["<leader>sna"] = {
      function()
        require("noice").cmd "all"
      end,
      "Noice All",
    },

    ["<leader>snl"] = {
      function()
        require("noice").cmd "last"
      end,
      "Noice Last Message",
    },

    ["<leader>snd"] = {
      function()
        require("noice").cmd "dismiss"
      end,
      "Dismiss All",
    },

    ["<c-f>"] = {
      function()
        if not require("noice.lsp").scroll(4) then
          return "<c-f>"
        end
      end,
      "Scroll forward",
      opts = { silent = true, expr = true },
    },

    ["<c-b>"] = {
      function()
        if not require("noice.lsp").scroll(-4) then
          return "<c-f>"
        end
      end,
      "Scroll backward",
      opts = { silent = true, expr = true },
    },
  },

  c = {
    ["<S-Enter>"] = {
      function()
        require("noice").redirect(vim.fn.getcmdline())
      end,
      "Redirect Cmdline",
    },
  },
}

M.trouble = {
  plugin = true,

  n = {
    ["<leader>xx"] = { "<cmd>TroubleToggle document_diagnostics<cr>", "Document Diagnostics (Trouble)" },

    ["<leader>xX"] = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "Document Workspace (Trouble)" },

    ["<leader>xL"] = { "<cmd>TroubleToggle loclist<cr>", "Location List (Trouble)" },

    ["<leader>xQ"] = { "<cmd>TroubleToggle quickfix<cr>", "Quickfix List (Trouble)" },

    ["[q"] = {
      function()
        if require("trouble").is_open() then
          require("trouble").previous { skip_groups = true, jump = true }
        else
          local ok, err = pcall(vim.cmd.cprev)
          if not ok then
            vim.notify(err, vim.log.levels.ERROR)
          end
        end
      end,
      "Previous trouble/quickfix item",
    },

    ["]q"] = {
      function()
        if require("trouble").is_open() then
          require("trouble").next { skip_groups = true, jump = true }
        else
          local ok, err = pcall(vim.cmd.cnext)
          if not ok then
            vim.notify(err, vim.log.levels.ERROR)
          end
        end
      end,
      "Next trouble/quickfix item",
    },
  },
}

M.ufo = {
  plugin = true,
  n = {
    ["zR"] = {
      function()
        require("ufo").openAllFolds()
      end,
      "Open all folds",
    },

    ["zM"] = {
      function()
        require("ufo").closeAllFolds()
      end,
      "Close all folds",
    },

    ["T"] = {
      function()
        local winid = require("ufo").peekFoldedLinesUnderCursor()
        if not winid then
          vim.lsp.buf.hover()
        end
      end,
      "Hover Fold LSP",
    },
  },
}

M.conform = {
  plugin = true,
  n = {
    ["<leader>fm"] = {
      function()
        require("conform").format {
          lsp_fallback = true,
          async = false,
          timeout_ms = 500,
        }
      end,
      "LSP Formatting (Conform.nvim)",
    },
  },
  v = {
    ["<leader>fm"] = {
      function()
        require("conform").format {
          lsp_fallback = true,
          async = false,
          timeout_ms = 500,
        }
      end,
      "LSP Formatting (Conform.nvim)",
    },
  },
}

return M
