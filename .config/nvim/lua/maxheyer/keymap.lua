local map = vim.api.nvim_set_keymap

local options = { noremap = false }
map('n', 'zz', '<CMD>:update<CR>', options) -- Save file
map('n', '<space>e', '<CMD>:lua vim.diagnostic.open_float({scope="line"})<CR>', options) -- Save file

map("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>", options) -- fancy find and replace

map("v", "J", ":m '>+1<CR>gv=gv", options) -- Move line down
map("v", "K", ":m '<-2<CR>gv=gv", options) -- Move line up
