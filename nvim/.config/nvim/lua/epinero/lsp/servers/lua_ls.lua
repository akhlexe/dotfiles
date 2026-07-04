return {
	settings = {
		Lua = {
			completion = {
				callSnippet = "Replace",
			},
			runtime = { version = "LuaJIT" },
			workspace = {
				checkThirdParty = false,
				library = { vim.env.VIMRUNTIME },
			},
			diagnostics = {
				globals = { "vim" },
				disable = { "missing-fields" },
			},
			format = {
				enable = false,
			},
		},
	},
}
