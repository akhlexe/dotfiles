
-- Copy last messages to system clipboard
vim.api.nvim_create_user_command('CopyMessages', function()
  vim.fn.setreg('+', vim.fn.execute('messages'))
  print("Messages copied to clipboard!")
end, {})
