local function init()
    local dap, dapui = require("dap"), require("dapui")
    require('dap-go').setup()

    local map = vim.api.nvim_set_keymap
    local options = { noremap = true }
    
    map('n', '<leader>dc', '<cmd>lua require"dap".continue()<CR>', options)
    map('n', '<leader>dsv', '<cmd>lua require"dap".step_over()<CR>', options)
    map('n', '<leader>dsi', '<cmd>lua require"dap".step_into()<CR>', options)
    map('n', '<leader>dso', '<cmd>lua require"dap".step_out()<CR>', options)
    map('n', '<leader>dtb', '<cmd>lua require"dap".toggle_breakpoint()<CR>', options)
    map('n', '<leader>dro', '<cmd>lua require"dap".repl.open()<CR>', options)

    map('n', '<leader>dcc', '<cmd>lua require"telescope".extensions.dap.commands{}<CR>', options)
    map('n', '<leader>dv', '<cmd>lua require"telescope".extensions.dap.variables{}<CR>', options)

    dapui.setup({
      icons = { expanded = "?", collapsed = "?" },
      mappings = {
        -- Use a table to apply multiple mappings
        expand = { "<CR>", "<2-LeftMouse>" },
        open = "o",
        remove = "d",
        edit = "e",
        repl = "r",
        toggle = "t",
      },
      sidebar = {
        -- You can change the order of elements in the sidebar
        elements = {
          -- Provide as ID strings or tables with "id" and "size" keys
          {
            id = "scopes",
            size = 0.25, -- Can be float or integer > 1
          },
          { id = "breakpoints", size = 0.25 },
          { id = "stacks", size = 0.25 },
          { id = "watches", size = 00.25 },
        },
        size = 40,
        position = "left", -- Can be "left", "right", "top", "bottom"
      },
      tray = {
        elements = { "repl" },
        size = 10,
        position = "bottom", -- Can be "left", "right", "top", "bottom"
      },
      floating = {
        max_height = nil, -- These can be integers or a float between 0 and 1.
        max_width = nil, -- Floats will be treated as percentage of your screen.
        border = "single", -- Border style. Can be "single", "double" or "rounded"
        mappings = {
          close = { "q", "<Esc>" },
        },
      },
      windows = { indent = 1 },
    })
    dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
    end
    dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
    end
    dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
    end
end

return {
  init = init
}