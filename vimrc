
" ----------------------------------------------------------------------------
" Vim Plug
" ----------------------------------------------------------------------------

call plug#begin('~/.vim/plugged')

" color schemes
Plug 'junegunn/seoul256.vim'
Plug 'sainnhe/everforest'

" interface
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/vim-peekaboo'
Plug 'preservim/tagbar'
Plug 'tpope/vim-vinegar'

" behavior / tools
Plug 'vim-scripts/vim-auto-save'
Plug 'tpope/vim-commentary'
Plug 'ludovicchabant/vim-gutentags'
Plug 'tpope/vim-surround'
Plug 'SirVer/ultisnips'
Plug 'ervandew/supertab'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-repeat'

" languages
Plug 'StanAngeloff/php.vim'
Plug 'plasticboy/vim-markdown'
Plug 'jwalton512/vim-blade'

" prose
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

Plug 'mattn/calendar-vim'

call plug#end()


" ----------------------------------------------------------------------------
" Colorscheme
" ----------------------------------------------------------------------------

if has('termguicolors')
    set termguicolors
endif

" allow sytax highlightking
syntax enable
" setfiletype htmldjango

" seoul256 light
" ---------------------------
"   Range:   252 (darkest) ~ 256 (lightest)
"   Default: 253
" let g:seoul256_background = 254
" let g:airline_theme='zenburn'
" set background=light
" colorscheme seoul256-light

" seoul256 light
" ---------------------------
" Range: soft, medium, hard
" Default: medium
let g:everforest_background = 'soft'
let g:airline_theme = 'everforest'
set background=dark
colorscheme everforest



" ----------------------------------------------------------------------------
" UltiSnips Config
" ----------------------------------------------------------------------------

let g:UltiSnipsExpandTrigger="<c-l>"
let g:UltiSnipsJumpForwardTrigger="<c-l>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" let g:SuperTabDefaultCompletionType = "<c-n>"

" ----------------------------------------------------------------------------
" Airline
" ----------------------------------------------------------------------------

autocmd VimEnter * silent AirlineToggleWhitespace
" let g:airline#extensions#tabline#enabled = 1

augroup blade
autocmd!
autocmd BufNewFile,BufRead *.blade.php set filetype=blade
augroup END


" ----------------------------------------------------------------------------
" Closetags
" ----------------------------------------------------------------------------

let g:closetag_filenames = '*.html,*.php'


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
autocmd BufRead,BufNewFile *.htm,*.html,*.blade.php,*.css setlocal tabstop=2 shiftwidth=2 softtabstop=2

" backspace
set backspace=indent,eol,start

" disable fzf preview window
let g:fzf_preview_window = ''

" persistent undo history
set undofile
set undodir=~/.vim/undodir

set wildignore+=vendor/**,tags,.git/**,libraries/**,storage/**,**/migrations/**,**/__pycache__/**

" hide netrw from buffer-toggle
let g:netrw_altfile = 1

" ----------------------------------------------------------------------------
" Appearance
" ----------------------------------------------------------------------------

" always show line numbers
set number

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

" escaping
inoremap jj <esc>
inoremap jk <esc>

" j and k by lines on screen
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

" easy exit
nnoremap <C-d> :q!<cr>

" window navigation
nnoremap <S-k> :bd<cr>
nnoremap <tab> <C-w>w
nnoremap <S-tab> <C-w>W

" terminal navigation
nnoremap \ :vert term<cr>
tnoremap <tab> <C-w>w
tnoremap <S-tab> <C-w>W

" quickfix navigation
nnoremap <F3> :cprev<cr>zz
nnoremap <F4> :cnext<cr>zz
nnoremap <F5> @@

" search highlighting
noremap <cr> :noh<cr><cr>

" tagbar toggle
nnoremap <F8> :TagbarToggle<cr>

" fzf searches
" nnoremap <leader>f :FZF<cr>
nnoremap <leader>f :FZF<cr>
nnoremap <nowait><leader>b :Buffers<cr>
nnoremap <leader>t :Tags<cr>

" writing
nnoremap <leader>G :Goyo<cr>
nnoremap <leader>T :Toc<cr>

" search for word under cursor, including first word
nnoremap * *N

" easy search and replace
nnoremap <C-h> :%s//gc<left><left><left>
nnoremap <C-f> :vimgrep '' **/*<left><left><left><left><left><left>

" edit the .vimrc file
nnoremap <leader>ev :e ~/.vim/vimrc<cr>
nnoremap <leader>so :so %<cr>

" edit the bash file
nnoremap <leader>eb :e ~/.bashrc<cr>

" edit snippets
nnoremap <leader>es :e ~/.vim/UltiSnips/python.snippets<cr>

" open the pyp directory
nnoremap <leader>p :Ex /home/james/pyp<cr>

" toggle spell check
nnoremap <leader>ss :set spell!<cr>

" toggle line wrap
nnoremap <leader>sw :set wrap!<cr>

" toggle line numbers
nnoremap <leader>sn :set number!<cr>

" insert text
func Eatchar(pat)
    let c = nr2char(getchar(0))
    return (c =~ a:pat) ? '' : c
endfunc
iab icd ## <c-r>=strftime('%Y-%m-%d')<cr>
iab ppr pprint()<left><c-r>=Eatchar('\s')<cr>
iab pr print()<left><c-r>=Eatchar('\s')<cr>

" search for visually selected text
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>N

" automatically close pairs
inoremap {<cr> {<cr>}<esc>O
inoremap {{ {}<left>
inoremap [[ []<left>
inoremap (( ()<left>
inoremap '' ''<left>

" add a semicolon at the end of a line
" nnoremap <leader>; $a;<esc>

" reload django apps
nnoremap <F5> :silent !touch config/wsgi.py<cr> <bar> :redraw!<cr>
