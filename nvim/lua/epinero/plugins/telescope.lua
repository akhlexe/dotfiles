return {
  {
    "nvim-telescope/telescope.nvim",
    branch = "master",
    dependencies = {
      "nvim-lua/plenary.nvim",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
        cond = function()
          return vim.fn.executable "make" == 1
        end,
      },
      "nvim-telescope/telescope-ui-select.nvim",
      "nvim-tree/nvim-web-devicons"
    },
    config = function()

      local actions = require "telescope.actions"
      local builtin = require "telescope.builtin"


      require("telescope").setup {
        defaults = {
          sorting_strategy = 'ascending',
          layout_strategy = 'horizontal',
          layout_config = {
            horizontal = {
              prompt_position = 'top',
              preview_width = 0.6,
              width = 0.85,
              height = 0.80,
            },
          },
          mappings = {
            i = {
              ['<C-k>'] = actions.move_selection_previous, -- move to prev result
              ['<C-j>'] = actions.move_selection_next, -- move to next result
              ['<C-l>'] = actions.select_default, -- open file
            },
            n = {
              ['q'] = actions.close,
            },
          },
        },
        pickers = {
          find_files = {
            file_ignore_patterns = { 'node_modules', '%.git', '%.venv' },
            hidden = true,
          },
          buffers = {
            initial_mode = 'normal',
            sort_lastused = true,
            -- sort_mru = true,
            mappings = {
              n = {
                ['d'] = actions.delete_buffer,
                ['l'] = actions.select_default,
              },
            },
          },
          marks = {
            initial_mode = 'normal',
          },
          oldfiles = {
            initial_mode = 'normal',
          },
        },
        live_grep = {
          file_ignore_patterns = { 'node_modules', '.git', '.venv' },
          additional_args = function(_)
            return { '--hidden' }
          end,
        },
        path_display = {
          filename_first = {
            reverse_directories = false,
          },
        },
        extensions = {
          ['ui-select'] = {
            require('telescope.themes').get_dropdown(),
          },
        },
        git_files = {
          previewer = false,
        },
      }

      -- Enable telescope fzf native, if installed
      pcall(require('telescope').load_extension, 'fzf')
      pcall(require('telescope').load_extension, 'ui-select')

      -- Core Keymaps
      vim.keymap.set('n', '<leader>sb', builtin.buffers, { desc = '[S]earch [B]uffers' })
      vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Find files' })
      vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Live grep' })
      vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Find buffers' })
      vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Find help' })

      -- Git keymaps
      vim.keymap.set('n', '<leader>gf', builtin.git_files, { desc = '[G]it [F]iles' })
      vim.keymap.set('n', '<leader>gc', builtin.git_commits, { desc = '[G]it [C]ommits' })
      vim.keymap.set('n', '<leader>gcf', builtin.git_bcommits, { desc = '[G]it [C]ommits for current [F]ile' })
      vim.keymap.set('n', '<leader>gb', builtin.git_branches, { desc = '[G]it [B]ranches' })
      vim.keymap.set('n', '<leader>gs', builtin.git_status, { desc = '[G]it [S]tatus' })

      vim.keymap.set('n', '<leader>so', builtin.oldfiles, { desc = '[S]earch [O]ldfiles' })
      vim.keymap.set('n', '<leader>sm', builtin.marks, { desc = 'Search marks' })
      vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
      vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' }) -- Resume previous search
      
      vim.keymap.set('n', '<leader>sds', function()
        builtin.live_grep {
          grep_open_files = true,
          prompt_title = 'Live Grep in Open Files',
        }
      end, { desc = '[S]earch LSP [D]ocument [S]ymbols' })
      vim.keymap.set('n', '<leader>/', function()
        builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
          previewer = false,
        })
      end, { desc = '[/] Fuzzy find in current buffer' })
    end,
  }
}
