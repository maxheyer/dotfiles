local function init()
    vim.api.nvim_exec([[
        augroup PHBSCF
            autocmd!
            autocmd BufWritePost,BufReadPost,InsertLeave *.php :lua require'phpcs'.cs()
            autocmd BufWritePre *.php :lua require'phpcs'.cbf()
        augroup END
    ]], false)
end

return {
  init = init
}
