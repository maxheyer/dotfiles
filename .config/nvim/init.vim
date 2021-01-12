" macos wide clipboard
set clipboard=unnamed

let mapleader = "\<SPACE>"
syntax enable
set encoding=UTF-8
set hidden
set nofixendofline
set guicursor=
set relativenumber
set nohlsearch
set noerrorbells
set smartindent
set nu
set nowrap
set undodir=~/.vim/undodir
set undofile
set scrolloff=8
set noshowmode
set completeopt=menuone,noinsert,noselect
set signcolumn=yes

" search
set smartcase
set incsearch

" true colors
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" disable backup files
set nobackup
set nowritebackup
set noswapfile

" give more space for displaying messages.
set cmdheight=2

" faster update time
set updatetime=50

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

" use spaces instead of tabs
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
retab

" vim-plug
call plug#begin()
    " nerdtree
    Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
    Plug 'ryanoasis/vim-devicons' " icons
    let g:NERDTreeWinSize=60
    let g:NERDTreeWinPos = "right"
    let g:NERDTreeQuitOnOpen = 1
    let g:NERDTreeAutoDeleteBuffer = 1
    let g:NERDTreeMinimalUI = 1
    let g:NERDTreeDirArrows = 1
    let g:NERDTreeChDirMode = 2
    autocmd StdinReadPre * let s:std_in=1
    autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
    autocmd VimEnter * NERDTree
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif " Close nerdtree when all tabs are closed
    autocmd! VimEnter * NERDTree | wincmd w " autofocus editor instead of NERDTree
    nnoremap <leader>t :NERDTreeToggle<CR>

    " themes
    Plug 'doums/darcula'
    Plug 'dikiaap/minimalist'

    " fzf
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'
    " use ripgrep for fzf indexing
    if executable('rg')
        let $FZF_DEFAULT_COMMAND = 'rg --files --no-messages "" .'
        let g:rg_derive_root='true'
    endif
    nnoremap <leader>v :Files<cr>
    nnoremap <leader>u :Tags<cr>
    nnoremap <leader>j :call fzf#vim#tags("'".expand('<cword>'))<cr>
    let g:fzf_layout = { 'down': '~40%' }

    " ripgrep
    nnoremap <leader>f :Rg<cr>

    " markdown
    Plug 'plasticboy/vim-markdown'
    
    " airline status bar and tab bar
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'

    " ncm2
    Plug 'ncm2/ncm2'
    Plug 'roxma/nvim-yarp'
    Plug 'ncm2/ncm2-bufword'
    Plug 'ncm2/ncm2-path'
    augroup ncm2
      au!
      autocmd BufEnter * call ncm2#enable_for_buffer()
      au User Ncm2PopupOpen set completeopt=noinsert,menuone,noselect
      au User Ncm2PopupClose set completeopt=menuone
    augroup END
    " cycle through completion entries with tab/shift+tab
    inoremap <expr> <TAB> pumvisible() ? "\<c-n>" : "\<TAB>"
    inoremap <expr> <s-tab> pumvisible() ? "\<c-p>" : "\<TAB>"
    nnoremap <leader>i :call phpactor#UseAdd()<cr> 

    " coc
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    let g:coc_global_extensions = ['coc-tslint-plugin', 'coc-tsserver', 'coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-yank', 'coc-prettier']

    " rust lang
    Plug 'rust-lang/rust.vim'
    Plug 'racer-rust/vim-racer'
    let g:racer_experimental_completer = 1

    " php
    Plug 'beyondwords/vim-twig'
    Plug 'phpactor/phpactor', {'for': 'php', 'branch': 'master', 'do': 'composer install --no-dev -o'}
    Plug 'phpactor/ncm2-phpactor'
    let g:phpactorPhpBin = "/usr/local/bin/php"

    " react next.js typescript
    Plug 'ianks/vim-tsx'
    Plug 'leafgarland/typescript-vim'

    " python
    Plug 'davidhalter/jedi-vim'

    " git
    Plug 'tpope/vim-fugitive'

    " tabs configuration
    nnoremap gn :bnext<CR>
    nnoremap gN :bprev<CR>

    " extras
    Plug 'tpope/vim-surround'
call plug#end()

" themes
set termguicolors
colorscheme minimalist
let g:airline_theme='minimalist'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif
let g:gruvbox_invert_selection='0'
