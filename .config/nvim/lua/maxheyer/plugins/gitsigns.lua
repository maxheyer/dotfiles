local function init()
    require('gitsigns').setup {
        current_line_blame = true
    }
end

return {
  init = init
}
