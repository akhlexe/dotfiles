vim.api.nvim_create_user_command("CopyLastError", function()
  vim.cmd('redir @+ | silent messages | redir END')
  print("📋 Last messages copied to clipboard!")
end, {})
