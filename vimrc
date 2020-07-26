

" ----------------------------------------------------------------------------
" Vim Plug
" ----------------------------------------------------------------------------

call plug#begin('~/.vim/plugged')

" color schemes
Plug 'junegunn/seoul256.vim'
Plug 'NLKNguyen/papercolor-theme'
Plug 'morhetz/gruvbox'

Plug 'vim-scripts/vim-auto-save'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-vinegar'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

" languages
Plug 'StanAngeloff/php.vim'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'

" prose
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

" airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()


" ----------------------------------------------------------------------------
" Airline
" ----------------------------------------------------------------------------

let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='zenburn'


" ----------------------------------------------------------------------------
" Colorscheme
" ----------------------------------------------------------------------------

" allow sytax highlightking
syntax enable

" allow vim to use 256 colors instead of smaller color set provded by 
" set t_Co=256

" seoul256 light scheme
" 252 darkest - 256 lightest
 colorscheme seoul256-light
 let g:seoul256_background = 256

" colorscheme gruvbox
" set background=dark


" ----------------------------------------------------------------------------
" Behavior
" ----------------------------------------------------------------------------

" enable mouse usage
set mouse=a

" no swap files
set noswapfile

" case insensitive search
set ignorecase 

" case sensitive only if search contains uppercase letter
set smartcase    

" open splits on the right
set splitright

" markdown behavior
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_toc_autofit = 1

" autosave
let g:auto_save = 1
let g:auto_save_in_insert_mode = 0

" tabs
set tabstop=4  
set shiftwidth=4
set softtabstop=4
set expandtab

" backspace
set backspace=indent,eol,start


" ----------------------------------------------------------------------------
" Appearance
" ----------------------------------------------------------------------------

"always show line numbers
set number

"wrap lines
set wrap

"search highlighting
set nohlsearch

" break at whitespace not words
set linebreak

" show partial lines at the bottom of the screen
set display=lastline


" ----------------------------------------------------------------------------
" Mappings
" ----------------------------------------------------------------------------

" leader
:let mapleader = " "
          
" easy esc to command mode
inoremap kk <Esc>
inoremap jj <Esc>
inoremap kj <Esc>
inoremap jk <Esc>

" j and k by lines on screen
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

" C-j and C-k by lines 
nnoremap <S-j> j
nnoremap <S-k> k
vnoremap <S-j> j
vnoremap <S-k> k

" shift tab removes indent
nnoremap <S-Tab> <C-d>
inoremap <S-Tab> <C-d>

" access to fzf
nnoremap <leader>f :FZF<cr>
nnoremap <leader>t :Tags<cr>
nnoremap <nowait> <leader>b :Buffers<cr>

" edit the .vimrc file
nnoremap <leader>ev :e ~/.vim/vimrc<cr>

" toggle spell check
nnoremap <leader>ss :set spell!<cr>

" toggle line wrap
nnoremap <leader>sw :set wrap!<cr>

" insert text
iab icd *<c-r>=strftime('%Y-%m-%d')<cr>*
iab tnh Thich Nhat Hanh

