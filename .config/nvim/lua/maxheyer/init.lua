require("maxheyer.set")
require("maxheyer.packer")
require("maxheyer.keymap")
require("maxheyer.autocmd")

vim.opt.rtp:append(os.getenv("HOME") .. "/.dotfiles/.config/nvim/after")
