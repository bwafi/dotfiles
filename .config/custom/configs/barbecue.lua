local barbecue = require "barbecue"

barbecue.setup {
  attach_navic = true,
  create_autocmd = true,
  include_buftypes = { "" },
  exclude_filetypes = { "netrw", "toggleterm" },
  modifiers = {
    dirname = ":~:.",
    basename = "",
  },
  show_dirname = true,
  show_basename = true,
  show_modified = false,
  modified = function(bufnr)
    return vim.bo[bufnr].modified
  end,
  show_navic = true,
  lead_custom_section = function()
    return " "
  end,
  custom_section = function()
    return " "
  end,
  theme = {
    normal = { fg = "#c0caf5" },
    ellipsis = { fg = "#737aa2" },
    separator = { fg = "cyan" },
    modified = { fg = "#737aa2" },
    dirname = { link = "Comment" },
    basename = { link = "Comment", bold = false },

    context = {},
    context_file = { fg = "#ac8fe4" },
    context_module = { fg = "#ac8fe4" },
    context_namespace = { link = "@spacename" },
    context_package = { fg = "#ac8fe4" },
    context_class = { link = "Structure" },
    context_method = { link = "@method" },
    context_property = { link = "@property" },
    context_field = { link = "@field" },
    context_constructor = { link = "@constructor" },
    context_enum = { link = "Structure" },
    context_interface = { link = "Structure" },
    context_function = { link = "@function" },
    context_variable = { link = "@variable" },
    context_constant = { link = "Constant" },
    context_string = { link = "String" },
    context_number = { link = "Number" },
    context_boolean = { link = "Boolean" },
    context_array = { fg = "#ac8fe4" },
    context_object = { fg = "#ac8fe4" },
    context_key = { link = "Keyword" },
    context_null = { fg = "#ac8fe4" },
    context_enum_member = { link = "Constant" },
    context_struct = { link = "Structure" },
    context_event = { fg = "#ac8fe4" },
    context_operator = { link = "Operator" },
    context_type_parameter = { link = "Typedef" },
  },
  context_follow_icon_color = true,
  symbols = {
    modified = "●",
    ellipsis = "…",
    separator = "",
  },
  kinds = {
    File = "",
    Module = "",
    Namespace = "",
    Package = "",
    Class = "",
    Method = "",
    Property = "",
    Field = "",
    Constructor = "",
    Enum = "",
    Interface = "",
    Function = "",
    Variable = "",
    Constant = "",
    String = "",
    Number = "",
    Boolean = "",
    Array = "",
    Object = "",
    Key = "",
    Null = "",
    EnumMember = "",
    Struct = "",
    Event = "",
    Operator = "",
    TypeParameter = "",
  },
}
