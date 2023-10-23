local noice = require "noice"

noice.setup {
  cmdline = {
    view = "cmdline",
  },
  notify = {
    enabled = true,
  },
  lsp = {
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
      ["cmp.entry.get_documentation"] = true,
    },
    progress = {
      enabled = true,
    },
    hover = {
      enabled = false,
    },
    signature = {
      enabled = true,
    },
  },
  routes = {
    {
      filter = {
        event = "msg_show",
        any = {
          { find = "%d+L, %d+B" },
          { find = "; after #%d+" },
          { find = "; before #%d+" },
        },
      },
      view = "mini",
    },
    -- {
    --   filter = {
    --     event = "notify",
    --     find = "No information available",
    --   },
    --   opts = { skip = true },
    -- },
  },
  presets = {
    bottom_search = true,
    command_palette = true,
    long_message_to_split = true,
    inc_rename = true,
    lsp_doc_border = true, -- add a border to hover docs and signature help
  },
}