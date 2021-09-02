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
set updatetime=10
set lazyredraw
set shortmess+=c
set list

" linux wide clipboard
set clipboard+=unnamedplus

" ignore files
set wildignore+=**/.git/*
set wildignore+=**/node_modules/*

call plug#begin('~/.vim/plugged')

Plug 'folke/tokyonight.nvim', { 'branch': 'main' }

" Lsp Plugins
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'RishabhRD/popfix'
Plug 'RishabhRD/nvim-lsputils'

" Snippets
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'
Plug 'rafamadriz/friendly-snippets'

" Neovim Tree shitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

Plug 'rust-lang/rust.vim'
Plug 'simrat39/rust-tools.nvim'

" Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

Plug 'kyazdani42/nvim-web-devicons'
Plug 'ryanoasis/vim-devicons'

Plug 'romgrk/barbar.nvim'

Plug 'editorconfig/editorconfig-vim'
Plug 'sbdchd/neoformat'
Plug 'dstein64/nvim-scrollview'
Plug 'ttys3/nvim-blamer.lua'
Plug 'vim-vdebug/vdebug'
Plug 'hoob3rt/lualine.nvim'

call plug#end()

set t_Co=256
set background=dark
let g:tokyonight_style = "night"
colorscheme tokyonight
" highlight normal guibg=none

if executable('rg')
    let g:rg_derive_root='true'
endif

let mapleader = " "

" find files using telescope command-line sugar.
nnoremap <leader>n <cmd>:Telescope find_files theme=get_ivy find_command=rg,--no-ignore,--hidden,--files<cr>
nnoremap <leader>g <cmd>lua require('telescope.builtin').live_grep(require('telescope.themes').get_ivy({}))<cr>
nnoremap <leader>b <cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_ivy({}))<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags(require('telescope.themes').get_ivy({}))<cr>
nnoremap <leader>t <cmd>:Telescope file_browser theme=get_ivy hidden=true<cr>

nnoremap zz <cmd>:update<cr>
inoremap <c-c> <esc>

" use <tab> and <s-tab> to navigate through popup menu
imap <tab> <plug>(completion_smart_tab)
imap <s-tab> <plug>(completion_smart_s_tab)
let g:completion_enable_snippet = 'vim-vsnip'

nnoremap <tab> <cmd>:bnext<cr>
nnoremap <s-tab> <cmd>:bprevious<cr>

vnoremap <leader>p

lua require("maxheyer")

" use completion-nvim in every buffer
autocmd bufenter * lua require'completion'.on_attach()

autocmd bufwritepre,textchanged,insertleave *.ts neoformat
autocmd filetype typescript setlocal formatprg=prettier
" use formatprg when available
let g:neoformat_try_formatprg = 1

let bufferline = get(g:, 'bufferline', {})

" enable/disable animations
let bufferline.animation = v:true

" enable/disable auto-hiding the tab bar when there is a single buffer
let bufferline.auto_hide = v:false

" enable/disable current/total tabpages indicator (top right corner)
let bufferline.tabpages = v:true

" enable/disable close button
let bufferline.closable = v:true

" enables/disable clickable tabs
"  - left-click: go to buffer
"  - middle-click: delete buffer
let bufferline.clickable = v:true

" enable/disable icons
" if set to 'numbers', will show buffer index in the tabline
" if set to 'both', will show buffer index and icons in the tabline
let bufferline.icons = v:true

" sets the icon's highlight group.
" if false, will use nvim-web-devicons colors
let bufferline.icon_custom_colors = v:false

" Configure icons on the bufferline.
let bufferline.icon_separator_active = '▎'
let bufferline.icon_separator_inactive = '▎'
let bufferline.icon_close_tab = ''
let bufferline.icon_close_tab_modified = '●'

" Sets the maximum padding width with which to surround each tab.
let bufferline.maximum_padding = 4

" Sets the maximum buffer name length.
let bufferline.maximum_length = 30

" If set, the letters for each buffer in buffer-pick mode will be
" assigned based on their name. Otherwise or in case all letters are
" already assigned, the behavior is to assign letters in order of
" usability (see order below)
let bufferline.semantic_letters = v:true

" New buffer letters are assigned in this order. This order is
" optimal for the qwerty keyboard layout but might need adjustement
" for other layouts.
let bufferline.letters =
  \ 'asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP'

" Sets the name of unnamed buffers. By default format is "[Buffer X]"
" where X is the buffer number. But only a static string is accepted here.
let bufferline.no_name_title = v:null

""" config the plugin
lua <<EOF

require'nvim-blamer'.setup({
    enable = true,
    format = '%committer ? %committer-time-human ? %summary',
})

EOF

" VDEBUG

if !exists('g:vdebug_options')
    let g:vdebug_options = {}
endif
let g:vdebug_options.break_on_open = 0

" add keyword
autocmd FileType php set iskeyword+=$

lua <<EOF
vim.lsp.handlers['textDocument/codeAction'] = require'lsputil.codeAction'.code_action_handler
vim.lsp.handlers['textDocument/references'] = require'lsputil.locations'.references_handler
vim.lsp.handlers['textDocument/definition'] = require'lsputil.locations'.definition_handler
vim.lsp.handlers['textDocument/declaration'] = require'lsputil.locations'.declaration_handler
vim.lsp.handlers['textDocument/typeDefinition'] = require'lsputil.locations'.typeDefinition_handler
vim.lsp.handlers['textDocument/implementation'] = require'lsputil.locations'.implementation_handler
vim.lsp.handlers['textDocument/documentSymbol'] = require'lsputil.symbols'.document_handler
vim.lsp.handlers['workspace/symbol'] = require'lsputil.symbols'.workspace_handler
EOF

