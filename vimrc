
" ----------------------------------------------------------------------------
" Vim Plug
" ----------------------------------------------------------------------------

call plug#begin('~/.vim/plugged')

" color schemes
Plug 'junegunn/seoul256.vim'

" interface
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/vim-peekaboo'
Plug 'preservim/tagbar'
Plug 'tpope/vim-vinegar'
" Plug 'preservim/nerdtree'

" behavior / tools
Plug 'vim-scripts/vim-auto-save'
Plug 'tpope/vim-commentary'
Plug 'ludovicchabant/vim-gutentags'
Plug 'tpope/vim-surround'
Plug 'alvan/vim-closetag'

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

" allow sytax highlightking
syntax enable

" seoul256 light
" ---------------------------
"   Range:   252 (darkest) ~ 256 (lightest)
"   Default: 253
let g:seoul256_background = 254
let g:airline_theme='zenburn'
set background=light
colorscheme seoul256-light


" ----------------------------------------------------------------------------
" NERDTree
" ----------------------------------------------------------------------------

" Start NERDTree and put the cursor back in the other window.
" autocmd VimEnter * NERDTree | wincmd p

" " If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
" autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
"     \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

" nnoremap <C-t> :NERDTreeToggle<CR>
" nnoremap <C-n> :NERDTreeFind<CR>

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

" backspace
set backspace=indent,eol,start

" disable fzf preview window
let g:fzf_preview_window = ''

" persistent undo history
set undofile
set undodir=~/.vim/undodir

set wildignore+=vendor/**,tags,.git/**,libraries/**,storage/**,test/**

" hide netrw from buffer-toggle
let g:netrw_altfile = 1

" automatically close pairs
" inoremap ( ()<Esc>i
" inoremap [ []<Esc>i
" inoremap { {}<Esc>i
" inoremap {<CR> {<CR>}<Esc>O
" inoremap ' ''<esc>i
" inoremap " ""<esc>i

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
inoremap kj <esc>

" j and k by lines on screen
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

" window navigation
nnoremap <tab>   <c-w>w
nnoremap <S-tab> <c-w>W
nnoremap K :bd<cr>
nnoremap <C-d> :q!<cr>

" quickfix navigation
nnoremap ]q :cnext<cr>zz
nnoremap [q :cprev<cr>zz

" search highlighting
noremap <cr> :noh<cr><cr>

" tagbar toggle
nnoremap <F8> :TagbarToggle<cr>

" fzf searches
" nnoremap <leader>f :FZF<cr>
nnoremap <leader>f :GFiles<cr>
nnoremap <leader>F :FZF<cr>
nnoremap <nowait><leader>b :Buffers<cr>
nnoremap <leader>t :Tags<cr>

" writing
nnoremap <leader>G :Goyo<cr>
nnoremap <leader>T :Toc<cr>

" search for word under cursor, including first word
nnoremap * *N

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

" search for visually selected text
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>
