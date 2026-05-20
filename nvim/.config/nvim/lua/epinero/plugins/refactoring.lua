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
			return require("refactoring").refactor("Extract Function")
		end, { expr = true, desc = "Refactor: Extract function" })

		vim.keymap.set({ "n", "x" }, "<leader>rf", function()
			return require("refactoring").refactor("Extract Function To File")
		end, { expr = true, desc = "Refactor: Extract function to file" })

		vim.keymap.set({ "n", "x" }, "<leader>rv", function()
			return require("refactoring").refactor("Extract Variable")
		end, { expr = true, desc = "Refactor: Extract variable" })

		vim.keymap.set({ "n", "x" }, "<leader>rI", function()
			return require("refactoring").refactor("Inline Function")
		end, { expr = true, desc = "Refactor: Inline function" })

		vim.keymap.set({ "n", "x" }, "<leader>ri", function()
			return require("refactoring").refactor("Inline Variable")
		end, { expr = true, desc = "Refactor: Inline variable" })

		vim.keymap.set({ "n", "x" }, "<leader>rbb", function()
			return require("refactoring").refactor("Extract Block")
		end, { expr = true, desc = "Refactor: Extract block" })

		vim.keymap.set({ "n", "x" }, "<leader>rbf", function()
			return require("refactoring").refactor("Extract Block To File")
		end, { expr = true, desc = "Refactor: Extract block to file" })
	end,
}
