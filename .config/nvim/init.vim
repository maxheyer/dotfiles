" macos wide clipboard
set clipboard=unnamed

:let mapleader = "\<SPACE>"
syntax enable
set encoding=UTF-8
set hidden

" disable backup files
set nobackup
set nowritebackup
set noswapfile

" give more space for displaying messages.
set cmdheight=2

"show absolute line numbers
set number

" faster update time
set updatetime=300

" use spaces instead of tabs
:set expandtab
:set tabstop=4
:set shiftwidth=4
:retab

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
    Plug 'cocopon/iceberg.vim'

    " fzf
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'
    " use ripgrep for fzf indexing
    if executable('rg')
        let $FZF_DEFAULT_COMMAND = 'rg --files --no-messages "" .'
    endif
    nnoremap <leader>v :Files<cr>
    nnoremap <leader>u :Tags<cr>
    nnoremap <leader>j :call fzf#vim#tags("'".expand('<cword>'))<cr>

    " ripgrep
    nnoremap <leader>f :Rg<cr>

    " markdown
    Plug 'plasticboy/vim-markdown'

    " deoplete autocompletion
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    let g:deoplete#enable_at_startup = 1

    " airline status bar and tab bar
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'

    " rust lang
    Plug 'rust-lang/rust.vim'
    Plug 'racer-rust/vim-racer'
    let g:racer_experimental_completer = 1

    " git
    Plug 'airblade/vim-gitgutter'
call plug#end()

" themes
set background=dark
colorscheme iceberg
