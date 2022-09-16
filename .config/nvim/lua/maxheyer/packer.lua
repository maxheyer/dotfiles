-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require("packer").startup(function(use)
    -- Packer can manage itself
    use("wbthomason/packer.nvim")

    -- Icons
    use("kyazdani42/nvim-web-devicons")
    use("ryanoasis/vim-devicons")

    -- LSP
    use("neovim/nvim-lspconfig")
    use("onsails/lspkind-nvim")
    use("nvim-lua/lsp_extensions.nvim")
    use("glepnir/lspsaga.nvim")
    use("j-hui/fidget.nvim")
    use("ray-x/lsp_signature.nvim")

    -- Telescope
    use("nvim-lua/plenary.nvim")
    use("nvim-lua/popup.nvim")
    use("nvim-telescope/telescope-file-browser.nvim")
    use("nvim-telescope/telescope-fzy-native.nvim")
    use("nvim-telescope/telescope.nvim")

    -- Treesitter
    use("nvim-treesitter/nvim-treesitter", {
        run = ":TSUpdate"
    })

    -- Completion
    use("L3MON4D3/LuaSnip")
    use("rafamadriz/friendly-snippets")
    use("saadparwaiz1/cmp_luasnip")
    use("hrsh7th/cmp-nvim-lsp")
    use("hrsh7th/cmp-buffer")
    use("hrsh7th/nvim-cmp")

    -- Colorscheme
    use("catppuccin/nvim")

    -- Others
    use("lewis6991/gitsigns.nvim")
    use("simrat39/symbols-outline.nvim")
    use("akinsho/toggleterm.nvim")
    use("editorconfig/editorconfig-vim")
    use("TimUntersberger/neogit")
end)
