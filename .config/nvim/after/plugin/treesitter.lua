require("nvim-treesitter.install").prefer_git = true

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.blade = {
  install_info = {
    url = "https://github.com/EmranMR/tree-sitter-blade",
    files = {"src/parser.c"},
    branch = "main",
  },
  filetype = "blade"
}

require'nvim-treesitter.configs'.setup{
  prefer_git = true,
  ensure_installed = "all",
  highlight = {
    enable = true
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },
  indent = {
    enable = true
  }
}

local blade_group = vim.api.nvim_create_augroup("BladeFiltypeRelated", { clear = true })
vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, {
  pattern = "*.blade.php",
  group = blade_group,
  command = "set ft=blade"
})
