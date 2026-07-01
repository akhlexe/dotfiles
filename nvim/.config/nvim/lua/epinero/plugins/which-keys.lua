return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		spec = {
			{ "<leader>c", group = "Code" },
			{ "<leader>d", group = "Debug" },
			{ "<leader>f", group = "Find" },
			{ "<leader>g", group = "Git" },
			{ "<leader>r", group = "Refactor" },
			{ "<leader>s", group = "Search" },
			{ "<leader>t", group = "Tabs/Toggle" },
			{ "<leader>w", group = "Workspace" },
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
