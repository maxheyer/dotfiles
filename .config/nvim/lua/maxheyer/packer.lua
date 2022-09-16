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
      'ray-x/cmp-treesitter',

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
  use 'nvim-telescope/telescope-fzy-native.nvim'
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
      -- require'maxheyer.plugins.status_line'.init()
    end
  }

  use {
    'lewis6991/gitsigns.nvim',
    config = function ()
      require'maxheyer.plugins.gitsigns'.init()
    end
  }

  use 'kyazdani42/nvim-web-devicons'
  use 'ryanoasis/vim-devicons'

  use 'editorconfig/editorconfig-vim'

  use {"akinsho/toggleterm.nvim", tag = '*', config = function()
    require("toggleterm").setup({size = 30, open_mapping = [[<c-a>]]})
  end}

  use {"j-hui/fidget.nvim", config = function()
    require"fidget".setup{}
  end}

  use {"glepnir/lspsaga.nvim", config = function()
    require"lspsaga".init_lsp_saga({
      finder_request_timeout = 10000
    })
  end}

    use {"ray-x/lsp_signature.nvim", config = function()
    require"lsp_signature".setup{}
  end}
end

local function init()
  packer_verify()
  packer_startup()
end

return {
  init = init
}
