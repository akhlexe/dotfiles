return {
	"ThePrimeagen/refactoring.nvim",
	dependencies = {
		"lewis6991/async.nvim",
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	config = function()
		local refactoring = require("refactoring")

		refactoring.setup({})

		-- keymaps
		vim.keymap.set({ "n", "x" }, "<leader>re", function()
			refactoring.refactor("Extract Function")
		end, { desc = "Refactor: Extract function" })

		vim.keymap.set({ "n", "x" }, "<leader>rf", function()
			refactoring.refactor("Extract Function To File")
		end, { desc = "Refactor: Extract function to file" })

		vim.keymap.set({ "n", "x" }, "<leader>rv", function()
			refactoring.refactor("Extract Variable")
		end, { desc = "Refactor: Extract variable" })

		vim.keymap.set({ "n", "x" }, "<leader>rI", function()
			refactoring.refactor("Inline Function")
		end, { desc = "Refactor: Inline function" })

		vim.keymap.set({ "n", "x" }, "<leader>ri", function()
			refactoring.refactor("Inline Variable")
		end, { desc = "Refactor: Inline variable" })

		vim.keymap.set({ "n", "x" }, "<leader>rbb", function()
			refactoring.refactor("Extract Block")
		end, { desc = "Refactor: Extract block" })

		vim.keymap.set({ "n", "x" }, "<leader>rbf", function()
			refactoring.refactor("Extract Block To File")
		end, { desc = "Refactor: Extract block to file" })
	end,
}
