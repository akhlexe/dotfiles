-- lua/plugins/neotree.lua
return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = { 
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- optional, for icons
    "MunifTanjim/nui.nvim",
  },
  cmd = "Neotree",
  keys = {
    { "<leader>e", "<CMD>Neotree toggle<CR>", desc = "Toggle file tree" },
  },
  config = function()
    local neo_tree = require("neo-tree")
    neo_tree.setup({
      close_if_last_window = true,
      popup_border_style = "rounded",
      enable_git_status = false,
      enable_diagnostics = false,
      window = {
        position = "left",
        width = 30,
        mappings = {
          ["<space>"] = "none",
        },
      },
      filesystem = {
        follow_current_file = { enabled = true },
        use_libuv_file_watcher = true,
      },
    })
  end,
}
