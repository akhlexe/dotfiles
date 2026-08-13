local M = {}

function M.setup(dap)
	require("dap-vscode-js").setup({
		debugger_executable = vim.fn.stdpath("data") .. "/lazy/vscode-js-debug/out/src/dapDebugServer.js",
		adapters = { "pwa-node" },
	})

	local configurations = {
		{
			name = "Launch current file (Node)",
			type = "pwa-node",
			request = "launch",
			program = "${file}",
			cwd = "${workspaceFolder}",
			sourceMaps = true,
		},
		{
			name = "Launch current file (tsx)",
			type = "pwa-node",
			request = "launch",
			runtimeExecutable = "npx",
			runtimeArgs = { "tsx", "${file}" },
			cwd = "${workspaceFolder}",
			sourceMaps = true,
		},
		{
			name = "Attach to Node process",
			type = "pwa-node",
			request = "attach",
			processId = require("dap.utils").pick_process,
			cwd = "${workspaceFolder}",
			sourceMaps = true,
		},
	}

	for _, filetype in ipairs({ "javascript", "javascriptreact", "typescript", "typescriptreact" }) do
		dap.configurations[filetype] = configurations
	end
end

return M
