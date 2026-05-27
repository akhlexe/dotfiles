return {
	"lewis6991/gitsigns.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("gitsigns").setup({
			signs = {
				add = { text = "│" },
				change = { text = "│" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
			},
			on_attach = function(bufnr)
				local gs = package.loaded.gitsigns

				local function map(mode, l, r, opts)
					opts = opts or {}
					opts.buffer = bufnr
					vim.keymap.set(mode, l, r, opts)
				end

				-- Navigation
				map("n", "]c", function()
					if vim.wo.diff then
						return "]c"
					end
					vim.schedule(function()
						gs.next_hunk()
					end)
					return "<Ignore>"
				end, { expr = true, desc = "Next hunk" })

				map("n", "[c", function()
					if vim.wo.diff then
						return "[c"
					end
					vim.schedule(function()
						gs.prev_hunk()
					end)
					return "<Ignore>"
				end, { expr = true, desc = "Previous hunk" })

				-- Actions
				map("n", "<leader>ghs", gs.stage_hunk, { desc = "[G]it [H]unk [S]tage" })
				map("n", "<leader>ghr", gs.reset_hunk, { desc = "[G]it [H]unk [R]eset" })
				map("v", "<leader>ghs", function()
					gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
				end, { desc = "[G]it [H]unk [S]tage" })
				map("v", "<leader>ghr", function()
					gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
				end, { desc = "[G]it [H]unk [R]eset" })
				map("n", "<leader>ghp", gs.preview_hunk, { desc = "[G]it [H]unk [P]review" })
				map("n", "<leader>gbl", function()
					gs.blame_line({ full = true })
				end, { desc = "[G]it [B]lame [L]ine" })
			end,
		})
	end,
}
