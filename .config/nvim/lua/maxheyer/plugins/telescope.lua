local function init()
    require'telescope'.setup{
      defaults = {
        vimgrep_arguments = {
          'rg',
          '--color=never',
          '--no-heading',
          '--with-filename',
          '--line-number',
          '--column',
          '--hidden',
          '--no-ignore',
          '--smart-case'
        },
        prompt_prefix = "> ",
        selection_caret = "> ",
        entry_prefix = "  ",
        initial_mode = "insert",
        selection_strategy = "reset",
        sorting_strategy = "descending",
        layout_strategy = "vertical",
        layout_config = {
          vertical = { width = 0.8 },
          horizontal = {
            mirror = false,
          },
          vertical = {
            mirror = false,
          },
        },
        file_sorter =  require'telescope.sorters'.get_fuzzy_file,
        file_ignore_patterns = {},
        generic_sorter =  require'telescope.sorters'.get_generic_fuzzy_sorter,
        generic_sorter = require'telescope.sorters'.get_generic_fuzzy_sorter,
        winblend = 0,
        border = {},
        color_devicons = true,
        borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
        use_less = true,
        path_display = {},
        set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
        file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
        grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
        qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,
        theme = "ivy",
      },
      pickers = {
            live_grep = {
                theme = "ivy",
            },
            buffers = {
                theme = "ivy",
            },
            find_files = {
                theme = "ivy",
            },
            git_status = {
                theme = "ivy",
            },
            lsp_references = {
                theme = "ivy",
            },
            lsp_document_symbols = {
                theme = "ivy",
            },
            lsp_workspace_symbols = {
                theme = "ivy",
            },
            diagnostics = {
                theme = "ivy",
            },
            lsp_implementations = {
                theme = "ivy",
            },
            lsp_definitions = {
                theme = "ivy",
            },

      },
      extensions = {
        file_browser = {
           theme = "ivy",
        },
    },
  }

  local map = vim.api.nvim_set_keymap
  local options = { noremap = true }

  -- Builtin
  map('n', '<leader>fe', '<CMD>lua require("telescope").extensions.file_browser.file_browser({ cwd = vim.fn.expand("%:p:h") })<CR>', options)
  map('n', '<leader>ff', '<CMD>:Telescope find_files<CR>', options)
  map('n', '<leader>fl', '<CMD>lua require("telescope.builtin").live_grep()<CR>', options)
  map('n', '<leader>fb', '<CMD>lua require("telescope.builtin").buffers()<CR>', options)
  map('n', '<leader>fh', '<CMD>lua require("telescope.builtin").lsp_workspace_symbols()<CR>', options)
  map('n', '<leader>fd', '<CMD>lua require("telescope.builtin").lsp_workspace_diagnostics()<CR>', options)
  map('n', '<leader>fr', '<CMD>lua require("telescope.builtin").registers()<CR>', options)
  map('n', '<leader>ft', '<CMD>lua require("telescope.builtin").treesitter()<CR>', options)
  map('n', '<leader>fg', '<CMD>lua require("telescope.builtin").git_status()<CR>', options)

  -- Extensions
  map('n', '<leader>fs', '<CMD>lua require("telescope").extensions["session-lens"].search_session()<CR>', options)
  map('n', '<leader>fw', '<CMD>lua require("telescope").extensions.git_worktree.git_worktrees()<CR>', options)

  require'telescope'.load_extension "file_browser"
  require'telescope'.load_extension "dap"
  require'telescope'.load_extension "fzy_native"
end

return {
  init = init,
}
