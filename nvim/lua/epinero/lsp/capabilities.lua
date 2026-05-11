local M = {}

function M.get()
	return vim.lsp.protocol.make_client_capabilities()
end

return M
