
-- Show vim diagnostic on hold
vim.api.nvim_create_autocmd("CursorHold", {
  pattern = "*",
  callback = function()
    vim.diagnostic.open_float({scope="line"})
  end,
})
