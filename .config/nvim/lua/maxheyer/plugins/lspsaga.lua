local function init()
    local saga = require 'lspsaga'
    saga.init_lsp_saga()
end

return {
  init = init
}
