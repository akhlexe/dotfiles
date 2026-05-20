return {
	"stevearc/oil.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },

	opts = {
		view_options = {
			show_hidden = true,
		},

		default_file_explorer = true,

		columns = {
			"icon",
			-- "permissions",
			-- "size",
			-- "mtime",
		},

		keymaps = {
			["<CR>"] = "actions.select",
			["-"] = "actions.parent",
			["_"] = "actions.open_cwd",
			["g."] = "actions.toggle_hidden",
			["<C-v>"] = "actions.select_vsplit",
			["<C-s>"] = "actions.select_split",
			["<C-p>"] = "actions.preview",
			["q"] = "actions.close",
		},

		use_default_keymaps = false, -- since we define our own
	},

	keys = {
		{ "-", "<cmd>Oil<cr>", desc = "Open parent directory" },
	},
}
