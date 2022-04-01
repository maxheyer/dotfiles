local function init()
    vim.api.nvim_exec([[
        augroup PHBSCF
            autocmd!
            autocmd BufWritePost,BufReadPost,InsertLeave *.php :lua require'phpcs'.cs()
        augroup END
    ]], false)
end

return {
  init = init
}
