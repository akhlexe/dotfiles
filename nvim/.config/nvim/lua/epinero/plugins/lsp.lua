return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		-- Load completion before LSP setup so server capabilities include Blink support.
		"saghen/blink.cmp",
		-- Automatically install LSPs and related tools to stdpath for Neovim
		-- Mason must be loaded before its dependents so we need to set it up here.
		-- NOTE: `opts = {}` is the same as calling `require('mason').setup({})`
		{
			"mason-org/mason.nvim",
			---@module 'mason.settings'
			---@type MasonSettings
			---@diagnostic disable-next-line: missing-fields
			opts = {},
		},
		-- Maps LSP server names between nvim-lspconfig and Mason package names.
		"mason-org/mason-lspconfig.nvim",

		-- Useful status updates for LSP.
		{ "j-hui/fidget.nvim", opts = {} },

		-- Provides JSON and YAML schema sets for jsonls and yamlls.
		{ "b0o/schemastore.nvim", lazy = true },
	},
	config = function()
		require("epinero.lsp").setup()
	end,
}
