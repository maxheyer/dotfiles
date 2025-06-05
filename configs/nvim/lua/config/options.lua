-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt
opt.number = true
opt.relativenumber = true
opt.cursorline = false
opt.cursorcolumn = false
vim.g.snacks_animate = false
vim.g.root_spec = { "cwd" }
vim.lsp.handlers["textDocument/inlayHint"] = function() end
