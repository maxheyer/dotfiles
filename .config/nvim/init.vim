set guicursor=
set relativenumber
set nu
set nohlsearch
set hidden
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nowrap
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set termguicolors
set scrolloff=8
set noshowmode
set completeopt=menuone,noinsert,noselect
set colorcolumn=80
set signcolumn=yes
set cmdheight=2
set updatetime=50
set lazyredraw
set shortmess+=c

" linux wide clipboard
set clipboard+=unnamedplus

" ignore files
set wildignore+=**/.git/*
set wildignore+=**/node_modules/*

call plug#begin('~/.vim/plugged')

Plug 'jaredgorski/spacecamp'

" Lsp Plugins
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'tjdevries/lsp_extensions.nvim'

" Neovim Tree shitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'

Plug 'rust-lang/rust.vim'

" Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'

Plug 'romgrk/barbar.nvim'

call plug#end()

colorscheme spacecamp
highlight Normal guibg=none

if executable('rg')
    let g:rg_derive_root='true'
endif

let mapleader = " "

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

nnoremap zz <cmd>:update<CR>

inoremap <expr> <TAB> pumvisible() ? "\<c-n>" : "\<TAB>"
inoremap <expr> <s-tab> pumvisible() ? "\<c-p>" : "\<TAB>"

nnoremap <tab> <cmd>:BufferNext<CR>
nnoremap <s-tab> <cmd>:BufferPrevious<CR>

vnoremap <leader>p

let g:nvim_tree_side = 'right'
nnoremap <leader>t <cmd>:NvimTreeToggle<cr>

lua require("maxheyer")
lua require'nvim-treesitter.configs'.setup { highlight = { enable = true } }
