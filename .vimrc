"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup
set noswapfile

" Give more space for displaying messages.
set cmdheight=2

" Show absolute line numbers
set number

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

:set expandtab
:set tabstop=4
:set shiftwidth=4
:retab


" Map terminal exit
:tnoremap <Esc> <C-\><C-n>

" Change cursor

" Required:
set runtimepath+=/Users/maxheyer/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/Users/maxheyer/.cache/dein')
  call dein#begin('/Users/maxheyer/.cache/dein')

  " Let dein manage dein
  " Required:
  call dein#add('/Users/maxheyer/.cache/dein/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here like this:
  "call dein#add('Shougo/neosnippet-snippets')
  
  " General
  call dein#add('vim-syntastic/syntastic')
  call dein#add('kien/ctrlp.vim')
  call dein#add('junegunn/fzf')
  call dein#add('junegunn/fzf.vim')
  call dein#add('neoclide/coc.nvim', {'merged':0, 'rev': 'release'})
  call dein#add('jszakmeister/vim-togglecursor')
  call dein#add('tpope/vim-fugitive')
  call dein#add('ap/vim-buftabline')
  call dein#add('raimondi/delimitmate')

  " Themes
  call dein#add('vim-airline/vim-airline')
  call dein#add('Rigellute/rigel')

  " NERDTree
  call dein#add('scrooloose/nerdtree')
  call dein#add('Xuyuanp/nerdtree-git-plugin')
  call dein#add('jistr/vim-nerdtree-tabs')

  " Rust
  call dein#add('rust-lang/rust.vim')

  " PHP
  call dein#add('phpactor/phpactor', {'for': 'php', 'branch': 'master', 'do': 'composer install --no-dev -o'})

  " Python
  call dein#add('hdima/python-syntax')

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------

" General
nnoremap gn :bnext<CR>
nnoremap gN :bprev<CR>
colorscheme rigel

" NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
autocmd VimEnter * NERDTree
autocmd BufEnter * NERDTreeMirror
nmap <silent> <C-t> :NERDTreeToggle<CR>
map <C-n> :NERDTreeToggle<CR>

autocmd! VimEnter * NERDTree | wincmd w " autofocus file

let g:NERDTreeWinSize=60
let g:NERDTreeWinPos = "right"
let NERDTreeQuitOnOpen = 1
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let g:NERDTreeChDirMode = 2

" Rust
let g:rustfmt_autosave = 1

" coc.nvim
" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction
inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" vim-airline
let g:airline#extensions#tabline#enabled = 1
