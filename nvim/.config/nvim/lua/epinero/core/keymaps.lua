-- Disable the spacebar default behavior in Normal and Visual modes
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- save file without auto formatting.
vim.keymap.set("n", "<leader>cn", "<cmd>noautocmd w<cr>", { noremap = true, silent = true, desc = "[C]ode [N]o format save" })

-- quit file
vim.keymap.set("n", "<C-q>", "<cmd>q<cr>", { noremap = true, silent = true, desc = "[Q]uit" })

-- delete single character without copying into register
vim.keymap.set("n", "x", '"_x', { noremap = true, silent = true })

-- Buffers
vim.keymap.set("n", "<S-l>", ":bnext<CR>", { noremap = true, silent = true, desc = "[B]uffer [N]ext" })
vim.keymap.set("n", "<S-h>", ":bprevious<CR>", { noremap = true, silent = true, desc = "[B]uffer [P]revious" })
vim.keymap.set("n", "<leader>bd", ":bdelete<CR>", { noremap = true, silent = true, desc = "[B]uffer [D]elete" })
vim.keymap.set("n", "<leader>bn", "<cmd> enew<cr>", { noremap = true, silent = true, desc = "[B]uffer [N]ew" })

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
vim.keymap.set('n', '<leader>xq', '<cmd>copen<cr>', { noremap = true, silent = true, desc = 'Open [Q]uickfix list' })
vim.keymap.set('n', ']q', '<cmd>cnext<cr>', { noremap = true, silent = true, desc = 'Next quickfix item' })
vim.keymap.set('n', '[q', '<cmd>cprev<cr>', { noremap = true, silent = true, desc = 'Previous quickfix item' })

vim.keymap.set('n', '<leader>td', function()
  if vim.diagnostic.is_enabled() then
    vim.diagnostic.disable()
    return
  end

  vim.diagnostic.enable()
end, { desc = '[T]oggle [D]iagnostics' })

vim.keymap.set('n', '<leader>tw', function()
  vim.wo.wrap = not vim.wo.wrap
end, { desc = '[T]oggle [W]rap' })
