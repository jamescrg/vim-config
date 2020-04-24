

" ----------------------------------------------------------------------------
" Vim Plug
" ----------------------------------------------------------------------------

call plug#begin('~/.vim/plugged')

Plug 'NLKNguyen/papercolor-theme'
Plug 'junegunn/seoul256.vim'
Plug 'blueshirts/darcula'

Plug 'vim-scripts/vim-auto-save'
Plug 'StanAngeloff/php.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'qpkorr/vim-bufkill'
Plug 'tpope/vim-vinegar'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'ludovicchabant/vim-gutentags'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

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

" seoul256 dark scheme
" 233 darkest - 239 lightest
"colorscheme seoul256
"let g:seoul256_background = 237

" set airline color and options
let g:airline_theme='zenburn'
let g:airline#extensions#tabline#enabled = 1
"autocmd VimEnter * AirlineToggleWhitespace


" ----------------------------------------------------------------------------
" Markdown
" ----------------------------------------------------------------------------

let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_toc_autofit = 1


" ----------------------------------------------------------------------------
" Relative Line Numbers
" ----------------------------------------------------------------------------

" set relativenumber
" set rnu
"set nonumber


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

"wrap lines
set wrap

"search highlighting
:set hlsearch


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

"make C-arrow keys work normally in putty
"  -- esc
" [D -- left arrow
" [C -- right arrow
map [D <C-left>
map! [D <C-left>
map [C <C-right>
map! [C <C-right>

" clear search highlighting
:nnoremap <cr> :nohlsearch<CR><CR>

" enter writing mode
nmap <Leader>g :Goyo 120<cr>

" easy esc to control mode
imap kk <Esc>
imap jj <Esc>
imap jk <Esc>
imap kj <Esc>
imap fj <Esc>

" turn on spell check
nmap <Leader>ss :set spell<cr>
nmap <Leader>sn :set nospell<cr>

" shortcut to close vim
nmap <F9> :bd<cr>
nmap <F12> :q<cr> 
imap <F12> <esc>:q<cr> 

" markdown
nmap <Leader>mt :Toc<cr>
nmap <Leader>mc <C-w>l <bar> :bd<cr>

" change between buffers
map <F3> :bprevious<CR>
map <F4> :bnext<CR>

" make it easy to edit the .vimrc file
nmap <Leader>ev :e ~/.vim/vimrc<cr>
nmap <Leader>so :source $MYVIMRC<cr>

" access to fzf
nmap <Leader>f :FZF <cr>
nmap <Leader>t :Tags<cr>
nmap <Leader>b :Buffers <cr>

" insert current date as markdown heading 2
iab icd ## <c-r>=strftime('%Y-%m-%d')<cr>

" facilitate moving through wrapped lines
imap <silent> <Down> <C-o>gj
imap <silent> <Up> <C-o>gk
nmap <silent> <Down> gj
nmap <silent> <Up> gk

" shift tab removes indent
nnoremap <S-Tab> <C-d>
inoremap <S-Tab> <C-d>

"search and replace
nmap <C-f> :%s/

" use ctrl keys to change between splits
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l
