return {
	settings = {
		gopls = {
			analyses = {
				unusedparams = true,
				unusedvariable = true,
				shadow = true,
				unusedwrite = true,
			},
			hints = {
				rangeVariableTypes = true,
				parameterNames = true,
				constantValues = true,
				assignVariableTypes = true,
				compositeLiteralFields = true,
				compositeLiteralTypes = true,
				functionTypeParameters = true,
			},
			staticcheck = true,
			gofumpt = true,
			usePlaceholders = false,
			completeUnimported = true,
		},
	},
}
