vim.g.mapleader = " "
vim.g.rg_derive_root = true

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.errorbells = false

vim.opt.title = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true
vim.opt.autoindent = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.undofile = true
vim.opt.swapfile = false
vim.opt.backup = false

vim.opt.termguicolors = true
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"

vim.opt.cmdheight = 1

vim.opt.updatetime = 50

vim.opt.shortmess:append("c")

-- vim.opt.colorcolumn = "120"

vim.scriptencoding = 'utf-8'
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'

vim.cmd('set clipboard+=unnamedplus')

vim.opt.cursorline = true
vim.opt.winblend = 0
vim.opt.wildoptions = 'pum'
vim.opt.pumblend = 5
vim.opt.background = 'dark'

vim.cmd('au BufNewFile,BufRead *.wgsl set filetype=wgsl')
