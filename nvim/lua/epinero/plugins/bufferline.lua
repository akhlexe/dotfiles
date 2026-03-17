return {
  "akinsho/bufferline.nvim",
  dependencies = {
    'moll/vim-bbye',
    'nvim-tree/nvim-web-devicons',
  },
  config = function()
    require("bufferline").setup {
      options = {
        mode = "buffers", -- set to "tabs" to only show tabpages instead of buffers
        themable = true, -- allows highlight groups to be overriden i.e. sets highlights as default
        numbers = "none", -- can be "none" | "ordinal" | "buffer_id" | "both" | function({ ordinal, id, lower, raise }): string
          close_command = "Bdelete! %d", -- can be a string | function,
          buffer_close_icon = "",
          close_icon = "",
          path_components = 1, -- number of components in a path to show
          modified_icon = "●",
          left_trunc_marker = "",
          right_trunc_marker = "",
          max_name_length = 30,
          max_prefix_length = 30, -- prefix used when a buffer is de-duplicated
          tab_size = 21,
          diagnostics = false, -- can be false | "nvim_lsp" | "coc"
          diagnostics_update_in_insert = false,
          color_icons = true, -- whether or not to add the filetype icon highlights
          show_buffer_icons = true, -- disable filetype icons for buffers
          show_buffer_close_icons = true,
          show_close_icon = true,
          persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
          separator_style = { '|', '|' }, -- can be "slant" | "thick" | "thin" | { 'any', 'any' },
          enforce_regular_tabs = true,
          always_show_bufferline = true,
          show_tab_indicators = true,
          indicator = {
            style = "none",
          },
          icon_pinned = "車",
          minimum_padding = 1,
          maximum_padding = 5,
          maximum_length = 15,
          sort_by = "insert_at_end", -- can be "insert_at_end" | "insert_at_start" | "id" | "extension" | "relative_directory" | "directory" | "tabs"
        },
        highlights = {
          separator = {
            fg = "#434C5E",
          },
          buffer_selected = {
            bold = true,
            italic = false,
          },
        },

      }
    end,
  }
