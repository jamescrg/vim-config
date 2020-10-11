

" ----------------------------------------------------------------------------
" Vim Plug
" ----------------------------------------------------------------------------

call plug#begin('~/.vim/plugged')

" color schemes
Plug 'junegunn/seoul256.vim'
Plug 'sainnhe/forest-night'

" interface
Plug 'vim-scripts/vim-auto-save'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-vinegar'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/vim-peekaboo'

" languages
Plug 'StanAngeloff/php.vim'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'

" prose
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

Plug 'mattn/calendar-vim'

call plug#end()


" ----------------------------------------------------------------------------
" Airline
" ----------------------------------------------------------------------------

autocmd VimEnter * silent AirlineToggleWhitespace
let g:airline_theme='zenburn'


" ----------------------------------------------------------------------------
" Colorscheme
" ----------------------------------------------------------------------------

" allow sytax highlightking
syntax enable

" change color pallette
" set t_Co=256
set termguicolors

colorscheme forest-night

" ----------------------------------------------------------------------------
" Behavior
" ----------------------------------------------------------------------------

" enable mouse usage
set mouse=a

" no swap files
set noswapfile

" search
set smartcase    
set incsearch

" open splits on the right and bottom
set splitright
set splitbelow

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

" break at whitespace not words
set linebreak

" show partial lines at the bottom of the screen
set display=lastline

" eliminate delay leaving insert mode
set ttimeoutlen=50


" ----------------------------------------------------------------------------
" Mappings
" ----------------------------------------------------------------------------

" leader
let mapleader = " "

" j and k by lines on screen
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

" navigating splits
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

"navigating buffers
nnoremap <S-h> :bp<cr>
nnoremap <S-j> <C-^>
nnoremap <S-k> :bd<cr>
nnoremap <S-l> :bn<cr>

" moving in a line
nnoremap s F

" fzf searches
nnoremap <leader>f :FZF<cr>
nnoremap <leader>t :Tags<cr>
nnoremap <nowait> <leader>b :Buffers<cr>

" writing
nnoremap <leader>g :Goyo<cr>
nnoremap <leader>c :Toc<cr>

" easy search and replace
nnoremap <leader>r :%s//gc<left><left><left>

" edit the .vimrc file
nnoremap <leader>ev :e ~/.vim/vimrc<cr>
nnoremap <leader>so :so %<cr>

" toggle spell check
nnoremap <leader>ss :set spell!<cr>

" toggle line wrap
nnoremap <leader>sw :set wrap!<cr>

" insert text
iab icd ## <c-r>=strftime('%Y-%m-%d')<cr>
