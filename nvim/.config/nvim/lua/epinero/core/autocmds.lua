local group = vim.api.nvim_create_augroup("UserAutocmds", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
	group = group,
	pattern = {
		"javascript",
		"javascriptreact",
		"typescript",
		"typescriptreact",
	},
	callback = function()
		vim.opt_local.tabstop = 2
		vim.opt_local.shiftwidth = 2
		vim.opt_local.softtabstop = 2
		vim.opt_local.expandtab = true
		vim.opt_local.indentexpr = ""
		vim.opt_local.smartindent = true
	end,
})
