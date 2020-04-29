

" ----------------------------------------------------------------------------
" Vim Plug
" ----------------------------------------------------------------------------

call plug#begin('~/.vim/plugged')

" color schemes
Plug 'NLKNguyen/papercolor-theme'
Plug 'junegunn/seoul256.vim'
Plug 'blueshirts/darcula'
Plug 'chuling/vim-equinusocio-material'

" behavior/interface
Plug 'vim-scripts/vim-auto-save'
Plug 'tpope/vim-commentary'
Plug 'qpkorr/vim-bufkill'
Plug 'tpope/vim-vinegar'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'ludovicchabant/vim-gutentags'

" languages
Plug 'StanAngeloff/php.vim'

" markdown
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'

" writing
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
" the terminal by default (putty / xterm)
set t_Co=256

" seoul256 light scheme
" 252 darkest - 256 lightest
colorscheme seoul256-light 
let g:seoul256_background = 254
let g:airline_theme='zenburn'

" seoul256 dark theme
"set background=dark
"colorscheme seoul256 
"let g:seoul256_background = 237


" ----------------------------------------------------------------------------
" Airline
" ----------------------------------------------------------------------------

" let g:airline#extensions#tabline#enabled = 1
autocmd VimEnter * silent AirlineToggleWhitespace

"set laststatus=2
"set statusline+=%{wordcount().words}\ words

" ----------------------------------------------------------------------------
" Markdown
" ----------------------------------------------------------------------------

let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_toc_autofit = 1


" ----------------------------------------------------------------------------
" Behavior
" ----------------------------------------------------------------------------

" no swap files
set noswapfile

" incremental search
set incsearch

" smart case searching (ucase sensitive, lcase insensitive)
" set smartcase

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

"visually indicate insert mode
":autocmd InsertEnter,InsertLeave * set cul!

"always show line numbers
set number

" use relative numbers
" set relativenumber

"hide line numbers
"set nonumber

"wrap lines
set wrap

"search highlighting
":set hlsearch
:set nohlsearch


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

" line breaks
set linebreak


" ----------------------------------------------------------------------------
" Window Management
" ----------------------------------------------------------------------------

set splitbelow
set splitright


" ----------------------------------------------------------------------------
" Mappings
" ----------------------------------------------------------------------------

" leader
:let mapleader = ","

" access to fzf
nnoremap <Leader>f :FZF<cr>
nnoremap <Leader>t :Tags<cr>
nnoremap <Leader>w :Buffers<cr>

" easy esc to control mode
inoremap kk <Esc>
inoremap kf <Esc>
inoremap jj <Esc>
inoremap jf <Esc>

" j and k by lines on screen, as with modern editors
nnoremap j gj
nnoremap k gk

" use ctrl keys to navigate splits
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <C-c> :close<cr>


"make C-arrow keys work normally in putty
"  -- esc
" [D -- left arrow
" [C -- right arrow
map [D <C-left>
map! [D <C-left>
map [C <C-right>
map! [C <C-right>

" facilitate moving through wrapped lines
inoremap <silent> <Down> <C-o>gj
inoremap <silent> <Up> <C-o>gk
nnoremap <silent> <Down> gj
nnoremap <silent> <Up> gk

" clear search highlighting
:nnoremap <cr> :nohlsearch<CR><CR>

" enter writing mode
nnoremap <Leader>go :Goyo 120<cr>
nnoremap <Leader>gc :Goyo!<cr>

" turn on spell check
nnoremap <Leader>ss :set spell!<cr>

" shortcut to close vim
nnoremap <F9> :bd<cr>
nnoremap <F12> :q<cr> 
inoremap <F12> <esc>:q<cr> 

" markdown
nnoremap <Leader>mt :Toc<cr>
nnoremap <Leader>mc <C-w>h :bd<cr>

" change between buffers
map <F3> :bprevious<CR>
map <F4> :bnext<CR>

" make it easy to edit the .vimrc file
nnoremap <Leader>ev :e ~/.vim/vimrc<cr>
nnoremap <Leader>so :source $MYVIMRC<cr>

" insert current date as markdown heading 2
iab icd ## <c-r>=strftime('%Y-%m-%d')<cr>

" shift tab removes indent
nnoremap <S-Tab> <C-d>
inoremap <S-Tab> <C-d>

"search and replace
nnoremap <C-f> :%s/
