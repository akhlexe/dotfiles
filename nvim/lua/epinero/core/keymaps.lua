-- Set leader key
vim.g.mapleader = " "

-- Latinoamerican keyboard users rejoice
vim.g.maplocalleader = "+"

-- Disable the spacebar default behavior in Normal and Visual modes
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- For conciseness
local opts = { noremap = true, silent = true }

-- save file
vim.keymap.set("n", "<C-s>", "<cmd>w<cr>", opts)

-- save file without auto formatting.
vim.keymap.set("n", "<leader>sn", "<cmd>noautocmd w<cr>", opts)

-- quit file
vim.keymap.set("n", "<C-q>", "<cmd>q<cr>", opts)

-- delete single character without copying into register
vim.keymap.set("n", "x", '"_x', opts)

-- Buffers
vim.keymap.set("n", "<S-l>", ":bnext<CR>", opts)
vim.keymap.set("n", "<S-h>", ":bprevious<CR>", opts)
vim.keymap.set("n", "<leader>x", ":bdelete<CR>", opts)
vim.keymap.set("n", "<leader>b", "<cmd> enew<cr>", opts)

-- Tabs
vim.keymap.set("n", "<leader>to", ":tabnew<CR>", opts)
vim.keymap.set("n", "<leader>tx", ":tabclose<CR>", opts)
vim.keymap.set("n", "<leader>tn", ":tabn<CR>", opts)
vim.keymap.set("n", "<leader>tp", ":tabp<CR>", opts)

-- stay in indent mode
vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)

-- Diagnostic keymaps
-- No estoy seguro todavia de su utilidad.
vim.keymap.set('n', '[d', function()
  vim.diagnostic.jump { count = -1, float = true }
end, { desc = 'Go to previous diagnostic message' })

vim.keymap.set('n', ']d', function()
  vim.diagnostic.jump { count = 1, float = true }
end, { desc = 'Go to next diagnostic message' })

vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

