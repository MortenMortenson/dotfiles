filetype plugin indent on
syntax on
set noerrorbells
set nocompatible

"set system clipboard
set clipboard+=unnamedplus
"History, no swapfile and
set nobackup
set noswapfile
set undodir=~/.vim/undodir
set undofile
set history=200

"Fix tabs and indent
set softtabstop=4
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set smartindent

set backspace=indent,eol,start
set wildmenu
set wildoptions-=pum
set number relativenumber
set spelllang=en_us
set hidden
set ignorecase
set smartcase
set mouse=a
set list
set listchars=tab:\|\\u202F,trail:\\u202F
set incsearch

"Plugins
call plug#begin('~/.config/nvim/plugged')
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
"Writing tools
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'reedes/vim-pencil'
Plug 'vimwiki/vimwiki'
Plug 'airblade/vim-gitgutter'
"Appearance
Plug 'arcticicestudio/nord-vim'
Plug 'rmehri01/onenord.nvim', { 'branch': 'main' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ap/vim-css-color'
Plug 'preservim/nerdtree'
Plug 'mhinz/vim-startify'
Plug 'mbbill/undotree'
Plug 'tmsvg/pear-tree'
call plug#end()

"Appearance
set termguicolors
let g:airline_theme='nord_minimal'
colorscheme onenord
set background=dark
let &t_8f = "\<Esc>[38:2:%lu:%lu:%lum"
let &t_8b = "\<Esc>[48:2:%lu:%lu:%lum"
set t_Co=256

"---Syntax on no filename
autocmd BufNewFile,BufRead * if expand('%:t') !~ '\.' | set syntax=bash | endif

"Keymap
let mapleader = " "
nnoremap <leader>g =:Goyo <bar> <CR>
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!
nnoremap s <Nop>
nnoremap <leader>t :tabnew<CR>
nnoremap <leader>w :tabclose<CR>
nnoremap <leader>1 gt1 
nnoremap <leader>2 gt2 


"Pencil
augroup pencil
  autocmd!
  autocmd FileType markdown,mkd call pencil#init()
  autocmd FileType text         call pencil#init()
augroup END
"NerdTree
nnoremap <C-t> :NERDTreeToggle<CR>
" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
