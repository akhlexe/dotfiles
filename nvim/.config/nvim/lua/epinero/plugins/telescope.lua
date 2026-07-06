return {
	"nvim-telescope/telescope.nvim",
	version = "*",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
			cond = function()
				return vim.fn.executable("make") == 1
			end,
		},
		"nvim-telescope/telescope-ui-select.nvim",
		"nvim-tree/nvim-web-devicons",
	},
	cmd = "Telescope",
	keys = {
		{ "<leader>ff", function() require("telescope.builtin").find_files() end, desc = "Find files" },
		{ "<leader>fg", function() require("telescope.builtin").live_grep() end, desc = "Live grep" },
		{ "<leader>fb", function() require("telescope.builtin").buffers() end, desc = "Find buffers" },
		{ "<leader>fh", function() require("telescope.builtin").help_tags() end, desc = "Find help" },
		{ "<leader>fo", function() require("telescope.builtin").live_grep({ grep_open_files = true, prompt_title = "Live Grep in Open Files" }) end, desc = "Find in open files" },
		{ "<leader>/", function() require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({ previewer = false })) end, desc = "Fuzzy find in current buffer" },
		{ "<leader>gf", function() require("telescope.builtin").git_files() end, desc = "[G]it [F]iles" },
		{ "<leader>gc", function() require("telescope.builtin").git_commits() end, desc = "[G]it [C]ommits" },
		{ "<leader>gcf", function() require("telescope.builtin").git_bcommits() end, desc = "[G]it [C]ommits for current [F]ile" },
		{ "<leader>gb", function() require("telescope.builtin").git_branches() end, desc = "[G]it [B]ranches" },
		{ "<leader>gs", function() require("telescope.builtin").git_status() end, desc = "[G]it [S]tatus" },
		{ "<leader>so", function() require("telescope.builtin").oldfiles() end, desc = "[S]earch [O]ldfiles" },
		{ "<leader>sm", function() require("telescope.builtin").marks() end, desc = "Search marks" },
		{ "<leader>sd", function() require("telescope.builtin").diagnostics() end, desc = "[S]earch [D]iagnostics" },
		{ "<leader>sr", function() require("telescope.builtin").resume() end, desc = "[S]earch [R]esume" },
	},
	config = function()
		local actions = require("telescope.actions")

		require("telescope").setup({
			defaults = {
				sorting_strategy = "ascending",
				layout_strategy = "horizontal",
				layout_config = {
					horizontal = {
						prompt_position = "top",
						preview_width = 0.6,
						width = 0.85,
						height = 0.80,
					},
				},
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous, -- move to prev result
						["<C-j>"] = actions.move_selection_next, -- move to next result
						["<C-l>"] = actions.select_default, -- open file
						["<C-q>"] = actions.smart_send_to_qflist, -- send selected or all results to quickfix
					},
					n = {
						["<C-q>"] = actions.smart_send_to_qflist,
						["q"] = actions.close,
					},
				},
				path_display = {
					filename_first = {
						reverse_directories = false,
					},
				},
			},
			pickers = {
				find_files = {
					file_ignore_patterns = { "node_modules", "%.git", "%.venv" },
					hidden = true,
				},
				buffers = {
					initial_mode = "insert",
					sort_lastused = true,
					-- sort_mru = true,
					mappings = {
						n = {
							["d"] = actions.delete_buffer,
							["l"] = actions.select_default,
						},
					},
				},
				marks = {
					initial_mode = "normal",
				},
				oldfiles = {
					initial_mode = "normal",
				},
				live_grep = {
					file_ignore_patterns = { "node_modules", ".git", ".venv" },
					additional_args = function(_)
						return { "--hidden" }
					end,
				},
				git_files = {
					previewer = false,
				},
			},
			extensions = {
				["ui-select"] = {
					require("telescope.themes").get_dropdown(),
				},
			},
		})

		-- Enable telescope fzf native, if installed
		pcall(require("telescope").load_extension, "fzf")
		pcall(require("telescope").load_extension, "ui-select")
	end,
}
