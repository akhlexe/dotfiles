local M = {}

function M.setup()
	vim.diagnostic.config({
		update_in_insert = true,
		virtual_text = {
			spacing = 2,
			prefix = "●",
			severity = { min = vim.diagnostic.severity.ERROR },
		},
		-- sin subrayado: el mensaje alcanza
		underline = false,
		signs = true,
		severity_sort = true,
		float = {
			border = "rounded",
			source = "always", -- muestra de dónde viene (ts, lua, etc.)
		},
	})
end

return M
