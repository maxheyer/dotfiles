local function init()
  -- Theme settings
    vim.g.tokyonight_style = "night"
    vim.g.tokyonight_italic_functions = true

    vim.g.neon_style = "dark"
    vim.g.neon_italic_keyword = true
    vim.g.neon_italic_function = true
    vim.g.neon_transparent = true

  -- Load colorscheme
    vim.cmd[[colorscheme neon]]
end

return {
  init = init
}
