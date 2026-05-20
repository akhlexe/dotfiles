local M = {}

function M.global(client, bufnr)
	local map = function(keys, func, desc, mode)
		mode = mode or "n"
		vim.keymap.set(mode, keys, func, { buffer = bufnr, desc = "LSP: " .. desc })
	end

	map("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")
	map("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
	map("gI", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")
	map("<leader>D", require("telescope.builtin").lsp_type_definitions, "[D]efinition")
	map("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
	map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
	map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
	map("K", vim.lsp.buf.hover, "Hover Documentation")
	map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
	map("<leader>wa", vim.lsp.buf.add_workspace_folder, "[W]orkspace [A]dd Folder")
	map("<leader>wr", vim.lsp.buf.remove_workspace_folder, "[W]orkspace [R]emove Folder")
	map("<leader>wl", function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, "[W]orkspace [L]ist Folders")

	vim.keymap.set("v", "<leader>ca", vim.lsp.buf.code_action, { buffer = bufnr, desc = "Code Action" })
	vim.keymap.set("n", "<leader>ci", function()
		vim.lsp.buf.code_action({
			context = {
				only = { "source.organizeImports" },
			},
			apply = true,
		})
	end, { buffer = bufnr, desc = "Organize imports" })

	if client:supports_method("textDocument/documentHighlight", bufnr) then
		local highlight_augroup = vim.api.nvim_create_augroup("lsp-highlight", { clear = false })

		vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
			buffer = bufnr,
			group = highlight_augroup,
			callback = vim.lsp.buf.document_highlight,
		})

		vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
			buffer = bufnr,
			group = highlight_augroup,
			callback = vim.lsp.buf.clear_references,
		})

		vim.api.nvim_create_autocmd("LspDetach", {
			group = vim.api.nvim_create_augroup("lsp-detach", { clear = true }),
			callback = function(event)
				vim.lsp.buf.clear_references()
				vim.api.nvim_clear_autocmds({ group = "lsp-highlight", buffer = event.buf })
			end,
		})
	end

	if client:supports_method("textDocument/inlayHint", bufnr) then
		map("<leader>th", function()
			vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = bufnr }))
		end, "[T]oggle Inlay [H]ints")
	end
end

return M
