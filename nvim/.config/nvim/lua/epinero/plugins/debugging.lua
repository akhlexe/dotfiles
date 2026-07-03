return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"mason-org/mason.nvim",
		"jay-babu/mason-nvim-dap.nvim",
		"nvim-neotest/nvim-nio",
		"rcarriga/nvim-dap-ui",
		"leoluz/nvim-dap-go",
	},
	cmd = { "DapContinue", "DapToggleBreakpoint" },
	keys = {
		{ "<F5>", function() require("dap").continue() end, desc = "Continue" },
		{ "<leader>dt", function() require("dap").toggle_breakpoint() end, desc = "Toggle breakpoint" },
	},
	config = function()
		require("epinero.dap").setup()
	end,
}
