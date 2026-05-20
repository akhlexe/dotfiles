local M = {}

local capabilities = require("epinero.lsp.capabilities")
local diagnostics = require("epinero.lsp.diagnostics")
local on_attach = require("epinero.lsp.on_attach")
local servers = require("epinero.lsp.servers")

local function setup_lsp_attach()
	vim.api.nvim_create_autocmd("LspAttach", {
		group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
		callback = function(event)
			local client = vim.lsp.get_client_by_id(event.data.client_id)
			if not client then
				return
			end

			on_attach.global(client, event.buf)
		end,
	})
end

function M.setup()
	diagnostics.setup()
	setup_lsp_attach()

	local ensure_installed = vim.tbl_filter(function(name)
		return name ~= "roslyn_ls"
	end, vim.tbl_keys(servers))
	require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

	for name, server in pairs(servers) do
		server.capabilities = vim.tbl_deep_extend("force", capabilities.get(), server.capabilities or {})
		vim.lsp.config(name, server)
		vim.lsp.enable(name)
	end
end

return M
