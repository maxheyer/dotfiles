require("catppuccin").setup({
    flavour = "mocha", -- latte, frappe, macchiato, mocha
    transparent_background = true,
    term_colors = true,
    integrations = {
        cmp = true,
        gitsigns = true,
        telescope = true,
        fidget = true
  }
})

vim.cmd.colorscheme "catppuccin"
