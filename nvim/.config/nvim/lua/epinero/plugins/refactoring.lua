return {
	"ThePrimeagen/refactoring.nvim",
	dependencies = {
		"lewis6991/async.nvim",
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	keys = {
		{ "<leader>re", function() require("refactoring").refactor("Extract Function") end, mode = { "n", "x" }, desc = "Refactor: Extract function" },
		{ "<leader>rf", function() require("refactoring").refactor("Extract Function To File") end, mode = { "n", "x" }, desc = "Refactor: Extract function to file" },
		{ "<leader>rv", function() require("refactoring").refactor("Extract Variable") end, mode = { "n", "x" }, desc = "Refactor: Extract variable" },
		{ "<leader>rI", function() require("refactoring").refactor("Inline Function") end, mode = { "n", "x" }, desc = "Refactor: Inline function" },
		{ "<leader>ri", function() require("refactoring").refactor("Inline Variable") end, mode = { "n", "x" }, desc = "Refactor: Inline variable" },
		{ "<leader>rbb", function() require("refactoring").refactor("Extract Block") end, mode = { "n", "x" }, desc = "Refactor: Extract block" },
		{ "<leader>rbf", function() require("refactoring").refactor("Extract Block To File") end, mode = { "n", "x" }, desc = "Refactor: Extract block to file" },
	},
	config = function()
		require("refactoring").setup({})
	end,
}
