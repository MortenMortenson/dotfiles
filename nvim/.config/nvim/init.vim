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
Plug 'instant-markdown/vim-instant-markdown', {'for': 'markdown'}

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
Plug 'tpope/vim-commentary'
call plug#end()

"Appearance
set termguicolors
let g:airline_theme='nord_minimal'
colorscheme onenord
set background=dark
let &t_8f = "\<Esc>[38:2:%lu:%lu:%lum"
let &t_8b = "\<Esc>[48:2:%lu:%lu:%lum"

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
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Splits and Tabbed Files
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set splitbelow splitright

"Open split 
nnoremap <leader>n :vsplit<CR>
nnoremap <leader>m :split<CR>

" Remap splits navigation to just CTRL + hjkl
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Make adjusing split sizes a bit more friendly
noremap <silent> <C-Left> :vertical resize +3<CR>
noremap <silent> <C-Right> :vertical resize -3<CR>
noremap <silent> <C-Up> :resize +3<CR>
noremap <silent> <C-Down> :resize -3<CR>

" Change 2 split windows from vert to horiz or horiz to vert
map <Leader>sm <C-w>t<C-w>H
map <Leader>sn <C-w>t<C-w>K

" Removes pipes | that act as seperators on splits
"#set fillchars+=vert:\ 


"Pencil
augroup pencil
  autocmd!
  autocmd FileType markdown,mkd call pencil#init()
  autocmd FileType text         call pencil#init()
augroup END

"Instant markdown
let g:instant_markdown_autostart = 0
"NerdTree
nnoremap <C-t> :NERDTreeToggle<CR>
" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
