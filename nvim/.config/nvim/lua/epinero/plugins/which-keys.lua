return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
			spec = {
				{ "<leader>b", group = "Buffer" },
				{ "<leader>c", group = "Code" },
				{ "<leader>d", group = "Debug" },
				{ "<leader>f", group = "Find" },
				{ "<leader>g", group = "Git" },
				{ "<leader>gh", group = "Hunk" },
				{ "<leader>r", group = "Refactor" },
				{ "<leader>s", group = "Search" },
				{ "<leader>t", group = "Toggle" },
				{ "<leader>w", group = "Workspace" },
				{ "<leader>x", group = "Quickfix" },
			},
		},
	keys = {
		{
			"<leader>?",
			function()
				require("which-key").show({ global = false })
			end,
			desc = "Buffer Local Keymaps (which-key)",
		},
	},
}
