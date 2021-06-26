
" ----------------------------------------------------------------------------
" Vim Plug
" ----------------------------------------------------------------------------

call plug#begin('~/.vim/plugged')

" color schemes
Plug 'morhetz/gruvbox'

" interface
Plug 'vim-scripts/vim-auto-save'
Plug 'tpope/vim-commentary'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/vim-peekaboo'
Plug 'ludovicchabant/vim-gutentags'
Plug 'preservim/tagbar'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-vinegar'
Plug 'preservim/nerdtree'

" languages
Plug 'StanAngeloff/php.vim'
Plug 'jwalton512/vim-blade'
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
let g:airline_theme='gruvbox'
" let g:airline#extensions#tabline#enabled = 1

augroup blade
autocmd!
autocmd BufNewFile,BufRead *.blade.php set filetype=blade
augroup END

" ----------------------------------------------------------------------------
" Colorscheme
" ----------------------------------------------------------------------------

" allow sytax highlightking
syntax enable

set termguicolors

" background
set background=dark
" set background=light

" colorscheme
let g:gruvbox_contrast_dark = 'soft'
colorscheme gruvbox


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

" persistent undo history
set undofile
set undodir=~/.vim/undodir

" vimgrep ignore directories
set wildignore+=vendor/**,tags,.git/**,libraries/**

" search for word under cursor, including first word
nnoremap * *N

" hide netrw from buffer-toggle
let g:netrw_altfile = 1

" ----------------------------------------------------------------------------
" Appearance
" ----------------------------------------------------------------------------

" always show line numbers
set number

" relative line numbers
set relativenumber

"wrap lines
" set nowrap
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

nnoremap <C-n> :NERDTreeToggle<CR>

" escaping
inoremap jj <esc>
inoremap jk <esc>
inoremap kj <esc>
inoremap kk <esc>

" j and k by lines on screen
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

" backspace in normal mode
nnoremap <bs> X

" window navigation
nnoremap <tab>   <c-w>w
nnoremap <S-tab> <c-w>W

" terminal navigation
nnoremap \ :vert term<cr>
tnoremap \ <C-d>
tnoremap <tab>   <c-w>w
tnoremap <S-tab> <c-w>W

" buffer navigation
nnoremap <S-h> :bp<cr>
nnoremap <S-j> <C-^:>
nnoremap <S-l> :bn<cr>
nnoremap <S-k> :bd<cr>
nnoremap <F12> :q<cr>


" quickfix navigation
" nnoremap ]q :cnext<cr>zz
" nnoremap [q :cprev<cr>zz
" nnoremap <F3> :cnext<cr>zz
" nnoremap <F4> @@

" search highlighting
noremap <cr> :noh<cr><cr>

" tagbar toggle
nnoremap <F8> :TagbarToggle<cr>

" fzf searches
nnoremap <leader>f :FZF<cr>
nnoremap <leader>g :GFiles<cr>
nnoremap <leader>t :Tags<cr>
nnoremap <nowait><leader>b :Buffers<cr>

" writing
nnoremap <leader>G :Goyo<cr>
nnoremap <leader>t :Toc<cr>
nnoremap S [sz=

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

" multiple cursors
nnoremap c* /\<<C-R>=expand('<cword>')<CR>\>\C<CR>``cgn
nnoremap c# ?\<<C-R>=expand('<cword>')<CR>\>\C<CR>``cgN

" search for visually selected text
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>

" camel case conversion
vnoremap ,u :s/\<\@!\([A-Z]\)/\_\l\1/g<CR>gul
nnoremap ,c :s#_\(\l\)#\u\1#g
