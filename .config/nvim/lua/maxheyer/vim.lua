local function set_vim_g()
  vim.g.mapleader = " "
  vim.g.rg_derive_root = true
end

local function set_vim_o()
  local settings = {
    backup = false,
    errorbells = false,
    expandtab = true,
    hidden = true,
    scrolloff = 8,
    softtabstop = 0,
    showmode = false,
    termguicolors = true,
    hlsearch = false,
    incsearch = true,
    nu = true,
    undofile = true,
    swapfile = false,
    list = false
  }

  -- Generic vim.o
  for k, v in pairs(settings) do
    vim.o[k] = v
  end

  -- Custom vim.o
  vim.o.shortmess = vim.o.shortmess .. 'c'

  -- Not yet in vim.o
  vim.cmd('set clipboard=unnamedplus')
  vim.cmd('set encoding=utf8')
  vim.cmd('set shiftwidth=4')
  vim.cmd('set secure')
  vim.cmd('set splitright')
  vim.cmd('set tabstop=4')
  vim.cmd('set smarttab')
  vim.cmd('set updatetime=10')
end

local function set_vim_wo()
  vim.wo.relativenumber = true
  vim.wo.wrap = false
end

local function set_keymaps()
  local map = vim.api.nvim_set_keymap

  local options = { noremap = false }

  map('n', 'zz', '<CMD>:update<CR>', options)
end


local function init()
  set_vim_g()
  set_vim_o()
  set_vim_wo()
  set_keymaps()
end

return {
  init = init
}
