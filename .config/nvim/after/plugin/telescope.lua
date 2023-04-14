require("telescope").setup{
  defaults = {
    vimgrep_arguments = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--hidden",
      "--no-ignore",
      "--smart-case"
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
    file_sorter =  require("telescope.sorters").get_fuzzy_file,
    file_ignore_patterns = {
      "node_modules",
      "vendor",
      ".git",
      ".idea",
    },
    generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
    winblend = 0,
    border = {},
    color_devicons = true,
    borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
    use_less = true,
    path_display = {},
    set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
    file_previewer = require("telescope.previewers").vim_buffer_cat.new,
    grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
    qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
  },
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
      -- the default case_mode is "smart_case"
    }
  },
}

local map = vim.api.nvim_set_keymap
local options = { noremap = true }

-- Builtin
 map("n", "gr", '<cmd>lua require("telescope.builtin").lsp_references()<cr>', options)
map("n", "<leader>fe", '<cmd>lua require("telescope").extensions.file_browser.file_browser({ cwd = vim.fn.expand("%:p:h") })<cr>', options)
map("n", "<leader>ff", '<cmd>lua require("telescope.builtin").find_files({hidden = true})<cr>', options)
map("n", "<leader>fl", '<cmd>lua require("telescope.builtin").live_grep()<cr>', options)
map("n", "<leader>fb", '<cmd>lua require("telescope.builtin").buffers()<cr>', options)
map("n", "<leader>fh", '<cmd>lua require("telescope.builtin").lsp_dynamic_workspace_symbols()<cr>', options)
map("n", "<leader>fr", '<cmd>lua require("telescope.builtin").registers()<cr>', options)
map("n", "<leader>ft", '<cmd>lua require("telescope.builtin").treesitter()<cr>', options)
map("n", "<leader>gs", '<cmd>lua require("telescope.builtin").git_status()<cr>', options)
map("n", "<leader>gb", '<cmd>lua require("telescope.builtin").git_branches()<cr>', options)
map("n", "<leader>ds", '<cmd>lua require("telescope.builtin").lsp_document_symbols()<cr>', options)

require("telescope").load_extension("file_browser")
require("telescope").load_extension("fzf")
