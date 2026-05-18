local M = {}

function M.setup(dap)
	dap.configurations.cs = {
		{
			type = "coreclr",
			name = "Launch .NET project",
			request = "launch",
			cwd = "${workspaceFolder}",
			program = function()
				return vim.fn.input("Path to dll: ", vim.fn.getcwd() .. "/bin/Debug/", "file")
			end,
		},
	}
end

return M
