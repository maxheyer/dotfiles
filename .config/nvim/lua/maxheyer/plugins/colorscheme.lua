local function init()
  -- Theme settings
    local catppuccin = require("catppuccin")
    catppuccin.setup({
    })

  -- Load colorscheme
    vim.cmd[[colorscheme catppuccin]]
end

return {
  init = init
}
