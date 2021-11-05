local function init()
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local opts = { noremap = true, silent = true }

    vim.api.nvim_exec('noremap <F8> :lua require"dap".toggle_breakpoint() <cr>', true)
    vim.api.nvim_exec('noremap <F5> :lua require"dap".continue() <cr>', true)
    vim.api.nvim_exec('noremap <F2> :lua require"dap".step_over() <cr>', true)
    vim.api.nvim_exec('noremap <F3> :lua require"dap".step_into() <cr>', true)

    local dap = require('dap')
    dap.adapters.php = {
        type = 'executable',
        command = 'node';
        args = { '~/.vscode-php-debug/out/phpDebug.js' }
    }

    dap.configurations.php = {
        {
            type = 'php',
            request = 'launch',
            name = 'Listen for Xdebug',
            port = 9000
        }
    }
end

return {
    init = init
}
