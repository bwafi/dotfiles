local mini_files = require "mini.files"

mini_files.setup {
  -- Customization of explorer windows
  windows = {
    -- Whether to show preview of file/directory under cursor
    preview = true,
    -- Width of focused window
    width_focus = 30,
    -- Width of preview window
    width_preview = 50,
  },
  options = {
    use_as_default_explorer = false,
  },
}
