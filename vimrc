

" ----------------------------------------------------------------------------
" Vim Plug
" ----------------------------------------------------------------------------

call plug#begin('~/.vim/plugged')

" color schemes
Plug 'junegunn/seoul256.vim'
Plug 'sainnhe/forest-night'
Plug 'morhetz/gruvbox'

" interface
Plug 'vim-scripts/vim-auto-save'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-vinegar'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/vim-peekaboo'
Plug 'ludovicchabant/vim-gutentags'
Plug 'preservim/tagbar'

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


" ----------------------------------------------------------------------------
" Colorscheme
" ----------------------------------------------------------------------------

" allow sytax highlightking
syntax enable

" change color pallette
" set t_Co=256
set termguicolors

colorscheme forest-night
" set background=dark
" colorscheme gruvbox


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
set hlsearch

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
set softtabstop=4  
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent
set shiftround 

" backspace
set backspace=indent,eol,start

" disable fzf preview window
let g:fzf_preview_window = ''

" enable folding
set foldmethod=indent
set foldlevel=99

" autocompleted
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>


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

" escaping
inoremap jk <esc>
tnoremap jk <C-\><C-n>

" j and k by lines on screen
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

" buffer navigation
nnoremap <F3> :bn<cr>
nnoremap <F4> :bp<cr>
nnoremap <F5> :bd<cr>
nnoremap <S-k> :bd<cr>

" window navigation
noremap <tab> <C-w>w
noremap <S-tab> <C-w>W
noremap <leader>w <C-w>

" terminal navigation
tnoremap <tab> <C-w>w
tnoremap <S-tab> <C-w>W

" search highlighting
:noremap <cr> :noh<cr><cr>

" quitting vim
nnoremap <F11> :bd!<cr>
nnoremap <F12> :q!<cr>

" terminal navigation
nnoremap <leader>vt :vert term<cr>

" fzf searches
nnoremap <leader>f :FZF<cr>
nnoremap <leader>t :Tags<cr>
nnoremap <nowait><leader>b :Buffers<cr>

" writing
nnoremap <leader>G :Goyo<cr>
nnoremap <leader>T :Toc<cr>

" easy search and replace
nnoremap <leader>r :%s//gc<left><left><left>

" edit the .vimrc file
nnoremap <leader>ev :e ~/.vim/vimrc<cr>
nnoremap <leader>eb :e ~/.bashrc<cr>
nnoremap <leader>so :so %<cr>

" toggle spell check
nnoremap <leader>ss :set spell!<cr>

" toggle line wrap
nnoremap <leader>sw :set wrap!<cr>

" insert text
iab icd ## <c-r>=strftime('%Y-%m-%d')<cr>
