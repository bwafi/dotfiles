return {

  -- change neo-tree config
  {
    "nvim-neo-tree/neo-tree.nvim",
    -- opts will be merged with the parent spec
    opts = {
      window = {
        width = 30,
      },
      filesystem = {
        filtered_items = {
          -- visible = true, -- when true, they will just be displayed differently than normal items
          hide_dotfiles = false,
          hide_gitignored = false,
        },

        -- This will use the OS level file watchers to detect changes
        -- instead of relying on nvim autocmd events.
        -- use_libuv_file_watcher = true,
      },
    },
  },
}
