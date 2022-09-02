local cmd = vim.api.nvim_command
local fn = vim.fn
local packer = nil

local function packer_verify()
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ 'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path })
    cmd 'packadd packer.nvim'
  end
end

local function packer_startup()
  if packer == nil then
    packer = require'packer'
    packer.init()
  end

  local use = packer.use
  packer.reset()

  -- Packer
  use 'wbthomason/packer.nvim'

  -- Language Servers
  use {
    'neovim/nvim-lspconfig',
    requires = {
      'RishabhRD/popfix',
      'RishabhRD/nvim-lsputils',
      'nvim-lua/lsp_extensions.nvim',
    },
    config = function ()
      require'maxheyer.plugins.lspconfig'.init()
    end
  }

  -- Treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    requires = {
      'romgrk/nvim-treesitter-context',
    },
    run = 'TSUpdate',
    config = function ()
      require'maxheyer.plugins.treesitter'.init()
    end,
  }

  use {
    "zbirenbaum/copilot.lua",
    event = {"VimEnter"},
    config = function()
      vim.defer_fn(function()
        require("copilot").setup()
      end, 100)
    end,
  }

  use {
    "zbirenbaum/copilot-cmp",
    module = "copilot_cmp",
  }

  -- PHP
  use {
    'praem90/nvim-phpcsf',
    config = function ()
      require'maxheyer.plugins.php'.init()
    end,
  }

  -- Completion
  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'lukas-reineke/cmp-rg',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-nvim-lua',
      'hrsh7th/cmp-cmdline',

      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
      'rafamadriz/friendly-snippets',
      'onsails/lspkind-nvim',
    },
    config = function ()
      require'maxheyer.plugins.completion'.init()
    end
  }

  -- Telescope
  use 'nvim-lua/plenary.nvim'
  use 'nvim-lua/popup.nvim'
  use 'nvim-telescope/telescope-file-browser.nvim'
  use {
    'nvim-telescope/telescope.nvim',
    config = function ()
      require'maxheyer.plugins.telescope'.init()
    end
  }
  -- Debug
  use {
    'mfussenegger/nvim-dap',
    requires = {
        'leoluz/nvim-dap-go',
        'rcarriga/nvim-dap-ui',
        'nvim-telescope/telescope-dap.nvim'
    },
    config = function ()
      require'maxheyer.plugins.dap'.init()
    end
  }

  -- Themes
  use({
	"catppuccin/nvim",
	as = "catppuccin"
  })

  use {
    'folke/lsp-colors.nvim',
    config = function ()
      require'maxheyer.plugins.colorscheme'.init()
    end
  }

  -- Utilities
  use {
    'hoob3rt/lualine.nvim',
    config = function ()
      require'maxheyer.plugins.status_line'.init()
    end
  }

  use {
    'lewis6991/gitsigns.nvim',
    config = function ()
      require'maxheyer.plugins.gitsigns'.init()
    end
  }

  -- lightspeed
  use {
    'ggandor/lightspeed.nvim',
    requires = {
        'tpope/vim-repeat',
        'rcarriga/nvim-dap-ui',
        'nvim-telescope/telescope-dap.nvim'
    },
    config = function ()
      require'maxheyer.plugins.lightspeed'.init()
    end
  }

  use 'kyazdani42/nvim-web-devicons'
  use 'ryanoasis/vim-devicons'

  use 'editorconfig/editorconfig-vim'
end

local function init()
  packer_verify()
  packer_startup()
end

return {
  init = init
}
