local M = {}

local function find_runtimeconfig()
	local pattern = vim.fn.getcwd() .. "/src/**/bin/{Debug,Release}/net*/*.runtimeconfig.json"
	local files = vim.fn.glob(pattern, false, true)
	return files[1]
end

function M.setup(dap)
	dap.configurations.cs = {
		{
			type = "coreclr",
			name = "Launch .NET project",
			request = "launch",
			cwd = function()
				local runtimeconfig = find_runtimeconfig()
				if runtimeconfig then
					return vim.fn.fnamemodify(runtimeconfig, ":h:h:h:h")
				end
				return vim.fn.getcwd()
			end,
			program = function()
				local runtimeconfig = find_runtimeconfig()
				if runtimeconfig then
					return vim.fn.fnamemodify(runtimeconfig, ":r:r") .. ".dll"
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
