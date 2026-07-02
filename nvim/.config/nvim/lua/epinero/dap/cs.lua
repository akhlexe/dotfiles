local M = {}

function M.setup(dap)
	dap.configurations.cs = {
		{
			type = "coreclr",
			name = "Launch .NET project",
			request = "launch",
			cwd = function()
				local pattern = vim.fn.getcwd() .. "/src/**/bin/Debug/net8.0/*.API.dll"
				local files = vim.fn.glob(pattern, false, true)
				if #files > 0 then
					return vim.fn.fnamemodify(files[1], ":h:h:h:h")
				end
				return vim.fn.getcwd()
			end,
			program = function()
				local pattern = vim.fn.getcwd() .. "/src/**/bin/Debug/net8.0/*.API.dll"
				local files = vim.fn.glob(pattern, false, true)
				if #files > 0 then
					return files[1]
				end
				return vim.fn.input("Path to dll: ", "", "file")
			end,
			env = {
				ASPNETCORE_ENVIRONMENT = "Development",
			},
		},
	}
end

return M
