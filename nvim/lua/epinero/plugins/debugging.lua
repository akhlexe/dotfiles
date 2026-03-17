return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"nvim-neotest/nvim-nio",
		"rcarriga/nvim-dap-ui",
		"leoluz/nvim-dap-go",
	},
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")

		require("dap-go").setup()
		require("dapui").setup()

		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			dapui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			dapui.close()
		end

		-- Debug execution
		vim.keymap.set("n", "<F5>", function()
			require("dap").continue()
		end, { desc = "Continue" })
		vim.keymap.set("n", "<F10>", function()
			require("dap").step_over()
		end, { desc = "Step over" })
		vim.keymap.set("n", "<F11>", function()
			require("dap").step_into()
		end, { desc = "Step into" })
		vim.keymap.set("n", "<F12>", function()
			require("dap").step_out()
		end, { desc = "Step out" })

		-- Debug breakpoints
		vim.keymap.set("n", "<Leader>dt", dap.toggle_breakpoint, { desc = "Toggle breakpoint" })
		vim.keymap.set("n", "<Leader>dc", dap.continue, { desc = "Continue" })

		-- Debug control
		vim.keymap.set("n", "<leader>dq", dap.terminate, { desc = "Stop debugging" })
		vim.keymap.set("n", "<leader>dr", dap.restart, { desc = "Restart debugging" })

		-- REPL
		vim.keymap.set("n", "<leader>de", dap.repl.open, { desc = "Open debug REPL" })
	end,
}
