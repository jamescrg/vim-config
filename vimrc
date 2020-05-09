

" ----------------------------------------------------------------------------
" Vim Plug
" ----------------------------------------------------------------------------

call plug#begin('~/.vim/plugged')

" color scheme
Plug 'junegunn/seoul256.vim'

" behavior/interface
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

"airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()


" ----------------------------------------------------------------------------
" Colors
" ----------------------------------------------------------------------------

syntax enable

" allow vim to use 256 colors instead of smaller color set provded by 
set t_Co=256

 " seoul256 light scheme
 " 252 darkest - 256 lightest
 colorscheme seoul256-light 
 let g:seoul256_background = 254
 let g:airline_theme='zenburn'


 " ----------------------------------------------------------------------------
 " Airline
 " ----------------------------------------------------------------------------

 let g:airline#extensions#tabline#enabled = 1
 autocmd VimEnter * silent AirlineToggleWhitespace

set laststatus=2
set statusline+=%{wordcount().words}\ words


" ----------------------------------------------------------------------------
" Behavior
" ----------------------------------------------------------------------------

" no swap files
set noswapfile

" incremental search
" set incsearch
set ignorecase   " Case insensitive search
set smartcase    " Case sensitive only if search contains uppercase letter.

" markdown behavior
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_toc_autofit = 1


" ----------------------------------------------------------------------------
" Autosave
" ----------------------------------------------------------------------------

let g:auto_save = 1
let g:auto_save_in_insert_mode = 0


" ----------------------------------------------------------------------------
" Mouse
" ----------------------------------------------------------------------------

" enable mouse usage
set mouse=a


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
" Tabs and Typing
" ----------------------------------------------------------------------------

" tabs
set tabstop=4  
set shiftwidth=4
set softtabstop=4
set expandtab

" backspace
set backspace=indent,eol,start


" ----------------------------------------------------------------------------
" Window Management
" ----------------------------------------------------------------------------

set splitbelow
set splitright


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

" access to fzf
nnoremap <leader>f :FZF<cr>
nnoremap <leader>t :Tags<cr>
nnoremap <nowait> <leader>b :Buffers<cr>

" minimalist writing mode
nnoremap <leader>go :Goyo 120<cr>
nnoremap <leader>gc :Goyo!<cr>

" toggle spell check
nnoremap <leader>ss :set spell!<cr>

" close buffers and vim
nnoremap <leader>d :bd<cr>
nnoremap <leader>D :bd!<cr>
nnoremap <leader>q :q<cr> 
nnoremap <leader>Q :q!<cr> 

" change between buffers
nnoremap ]b :bnext<cr>
nnoremap [b :bprev<cr>

" markdown toc
nnoremap <leader>mt :Toc<cr>
nnoremap <leader>mc <C-w>h :bd<cr>

" make it easy to edit the .vimrc file
nnoremap <leader>ev :e ~/.vim/vimrc<cr>
nnoremap <leader>so :source $MYVIMRC<cr>

" insert current date as markdown heading 2
iab icd *<c-r>=strftime('%Y-%m-%d')<cr>*

" shift tab removes indent
nnoremap <S-Tab> <C-d>
inoremap <S-Tab> <C-d>
