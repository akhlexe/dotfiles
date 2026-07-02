-- Set leader key
vim.g.mapleader = " "

-- Latinoamerican keyboard users rejoice
vim.g.maplocalleader = "+"

-- Disable the spacebar default behavior in Normal and Visual modes
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- For conciseness
local opts = { noremap = true, silent = true }

-- save file without auto formatting.
vim.keymap.set("n", "<leader>sn", "<cmd>noautocmd w<cr>", { noremap = true, silent = true, desc = "[S]ave [N]o format" })

-- quit file
vim.keymap.set("n", "<C-q>", "<cmd>q<cr>", { noremap = true, silent = true, desc = "[Q]uit" })

-- delete single character without copying into register
vim.keymap.set("n", "x", '"_x', opts)

-- Buffers
vim.keymap.set("n", "<S-l>", ":bnext<CR>", { noremap = true, silent = true, desc = "[B]uffer [N]ext" })
vim.keymap.set("n", "<S-h>", ":bprevious<CR>", { noremap = true, silent = true, desc = "[B]uffer [P]revious" })
vim.keymap.set("n", "<leader>x", ":bdelete<CR>", { noremap = true, silent = true, desc = "Delete buffer" })
vim.keymap.set("n", "<leader>b", "<cmd> enew<cr>", { noremap = true, silent = true, desc = "[N]ew [B]uffer" })

-- stay in indent mode
vim.keymap.set("v", "<", "<gv", { noremap = true, silent = true, desc = "Indent left" })
vim.keymap.set("v", ">", ">gv", { noremap = true, silent = true, desc = "Indent right" })

-- Diagnostic keymaps
-- No estoy seguro todavia de su utilidad.
vim.keymap.set('n', '[d', function()
  vim.diagnostic.jump { count = -1, float = true }
end, { desc = 'Go to previous diagnostic message' })

vim.keymap.set('n', ']d', function()
  vim.diagnostic.jump { count = 1, float = true }
end, { desc = 'Go to next diagnostic message' })

vim.keymap.set('n', '<leader>cd', vim.diagnostic.open_float, { desc = '[C]ode [D]iagnostic float' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })
