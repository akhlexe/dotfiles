return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  cmd = {
    "NvimTreeToggle",
    "NvimTreeFocus",
    "NvimTreeFindFileToggle",
  },
  keys = {
    {
      "<leader>e",
      function()
        require("nvim-tree.api").tree.toggle({ focus = true })
      end,
      desc = "Toggle file tree",
    },
  },
  opts = {
    disable_netrw = true,
    hijack_netrw = true,
    view = {
      width = 30,
      side = "left",
    },
    renderer = {
      group_empty = true,
    },
    update_focused_file = {
      enable = true,
      update_root = false,
      ignore_list = {},
    },
    filters = {
      dotfiles = false,
    },
    actions = {
      open_file = {
        resize_window = false,
      },
    },
  },
}
