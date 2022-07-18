local present, nvimtree = pcall(require, "nvim-tree")

if not present then
  return
end

local options = {
  filters = {
    dotfiles = true, -- do not show dotfiles
  },
  git = {
    enable = false,
  },

  disable_netrw = true,
  hijack_netrw = true,

  renderer = {
    add_trailing = true,
  },

  view = {
    hide_root_folder = true,

    mappings = {
      custom_only = true, -- will use only the provided user mappings and not the default

      list = {
        { key = "l", action = "edit" },
        { key = "<2-LeftMouse>", action = "edit" },
        { key = "L", action = "cd" },
        { key = "<2-RightMouse>", action = "cd" },
        { key = "o", action = "system_open" },

        { key = "h", action = "close_node" },
        { key = "H", action = "dir_up" },
        { key = "W", action = "collapse_all" },

        { key = "J", action = "next_sibling" },
        { key = "K", action = "prev_sibling" },

        { key = "<C-v>", action = "vsplit" },
        { key = "<C-x>", action = "split" },

        { key = "y", action = "copy_name" },
        { key = "Y", action = "copy_absolute_path" },

        { key = "a", action = "create" },
        { key = "d", action = "remove" },
        { key = "r", action = "full_rename" },

        { key = "x", action = "cut" },
        { key = "c", action = "copy" },
        { key = "p", action = "paste" },

        { key = "F", action = "clear_live_filter" },
        { key = "f", action = "live_filter" },

        { key = "I", action = "toggle_file_info" },
        { key = ".", action = "run_file_command" },
        { key = "R", action = "refresh" },
        { key = "q", action = "close" },

        { key = "?", action = "toggle_help" },
        { key = "m", action = "toggle_mark" },
      },
    },
  },
}

nvimtree.setup(options)
