local function init()
  -- Theme settings
    local catppuccin = require("catppuccin")
    catppuccin.setup({
        transparent_background = true
    })

  -- Load colorscheme
    vim.cmd[[colorscheme catppuccin]]
end

return {
  init = init
}
