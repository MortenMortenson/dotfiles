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
"set autoindent
"set smartindent

"set backspace=indent,eol,start
set wildmenu
"set wildmode=longest:full,full
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
call plug#begin('~/local/share/nvim/plugged')
Plug 'morhetz/gruvbox'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/goyo.vim'
Plug 'vimwiki/vimwiki'
Plug 'airblade/vim-gitgutter'
Plug 'reedes/vim-pencil'
Plug 'ap/vim-css-color'
Plug 'preservim/nerdtree'
Plug 'mhinz/vim-startify'
call plug#end()

"Appearance
set notermguicolors
set background=dark
let &t_8f = "\<Esc>[38:2:%lu:%lu:%lum"
let &t_8b = "\<Esc>[48:2:%lu:%lu:%lum"
let g:airline_theme='apprentice'

"Keymap
let mapleader = " "
nnoremap <leader>g =:Goyo <bar> <CR> 
nnoremap s <Nop>
nnoremap <leader>t :tabnew<CR>
nnoremap <leader>w :tabclose<CR>
nnoremap <leader>1 gt1 
nnoremap <leader>2 gt2 

"NerdTree
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
