local M = {}

function M.setup()
	vim.diagnostic.config({
		virtual_text = {
			spacing = 2,
			prefix = "●",
		},
		signs = true,
		underline = true,
		severity_sort = true,
		float = {
			border = "rounded",
		},
	})
end

return M
