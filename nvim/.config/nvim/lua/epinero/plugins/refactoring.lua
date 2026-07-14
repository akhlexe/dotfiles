return {
	"ThePrimeagen/refactoring.nvim",
	dependencies = {
		"lewis6991/async.nvim",
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	keys = {
		{ "<leader>re", function() return require("refactoring").extract_func() end, mode = { "n", "x" }, expr = true, desc = "Refactor: Extract function" },
		{ "<leader>rf", function() return require("refactoring").extract_func_to_file() end, mode = { "n", "x" }, expr = true, desc = "Refactor: Extract function to file" },
		{ "<leader>rv", function() return require("refactoring").extract_var() end, mode = { "n", "x" }, expr = true, desc = "Refactor: Extract variable" },
		{ "<leader>rI", function() return require("refactoring").inline_func() end, mode = { "n", "x" }, expr = true, desc = "Refactor: Inline function" },
		{ "<leader>ri", function() return require("refactoring").inline_var() end, mode = { "n", "x" }, expr = true, desc = "Refactor: Inline variable" },
		{ "<leader>rs", function() return require("refactoring").select_refactor() end, mode = { "n", "x" }, desc = "Refactor: Select refactor" },
	},
	config = function()
		require("refactoring").setup({})
	end,
}
