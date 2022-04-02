
" ----------------------------------------------------------------------------
" Vim Plug
" ----------------------------------------------------------------------------

call plug#begin('~/.vim/plugged')

" ---------------------------------------
" color schemes
" ---------------------------------------
Plug 'junegunn/seoul256.vim'
Plug 'sainnhe/everforest'
Plug 'altercation/vim-colors-solarized'
Plug 'morhetz/gruvbox'


" ---------------------------------------
" interface
" ---------------------------------------
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-vinegar'


" ---------------------------------------
" behavior / tools
" ---------------------------------------

"  auto save
Plug 'vim-scripts/vim-auto-save'

" comment bindings
Plug 'tpope/vim-commentary'

" auto update tags file
Plug 'ludovicchabant/vim-gutentags'

" surround with quotes or brackets
Plug 'tpope/vim-surround'

" coerce case (e.g. snake to camel)
Plug 'tpope/vim-abolish'

" repeat plugin actions with repeat key
Plug 'tpope/vim-repeat'

" run django reload script without screen blank
Plug 'fcpg/vim-altscreen'

" navigate a long file
Plug 'preservim/tagbar'

" better autocomplete, always on
Plug 'maralla/completor.vim'

" code validation
Plug 'maralla/validator.vim'

" html shortcuts
Plug 'mattn/emmet-vim'


" ---------------------------------------
" prose
" ---------------------------------------

Plug 'plasticboy/vim-markdown'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'ron89/thesaurus_query.vim'

call plug#end()


" ----------------------------------------------------------------------------
" Colorscheme
" ----------------------------------------------------------------------------

 " if has('termguicolors')
"     set termguicolors
" endif

" allow sytax highlightking
syntax enable


" ---------------------------
" seoul256 light
" ---------------------------
"   Range:   252 (darkest) ~ 256 (lightest)
"   Default: 253
" ---------------------------
let g:seoul256_background = 253
let g:airline_theme='zenburn'
set background=light
colorscheme seoul256-light

" ---------------------------
" everforest
" ---------------------------
" Range: soft, medium, hard
" Default: medium
" ---------------------------
" set termguicolors
" let g:everforest_background = 'medium'
" let g:airline_theme = 'everforest'
" set background=dark
" colorscheme everforest

" ---------------------------
" solarized light
" ---------------------------
"  contrast options: low, medium, high
" ---------------------------
" set background=light
" let g:solarized_contrast='high'
" colorscheme solarized

" ---------------------------
" gruvbox dark
" ---------------------------
"  contrast options: soft, medium, hard
" ---------------------------
 " if has('termguicolors')
 "    set termguicolors
" endif
" set background=dark
" let g:gruvbox_contrast_dark='soft'
" colorscheme gruvbox


" ----------------------------------------------------------------------------
" Airline
" ----------------------------------------------------------------------------

autocmd VimEnter * silent AirlineToggleWhitespace


" ----------------------------------------------------------------------------
" Completor
" ----------------------------------------------------------------------------

autocmd Filetype markdown let g:completor_auto_trigger = 0
let g:completor_python_binary = '/home/james/.local/lib/python3.8/site-packages/jedi'

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<cr>"


" ----------------------------------------------------------------------------
" Validator
" ----------------------------------------------------------------------------

let g:validator_python_checkers = ['flake8']
let g:validator_css_checkers = ['csslint']


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
set comments=fb:-,fb:*

autocmd BufRead,BufNewFile *.html,*.css setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd BufRead,BufNewFile *.html set filetype=htmldjango

" backspace
set backspace=indent,eol,start

" disable fzf preview window
let g:fzf_preview_window = ''

" persistent undo history
set undofile
set undodir=~/.vim/undodir

set wildignore+=tags,.git/**
set wildignore+=**/migrations/**,**/__pycache__/**
set wildignore+=static/bootstrap-3.3.7/**,static/images/**
set wildignore+=static/admin/**

" hide netrw from buffer-toggle
let g:netrw_altfile = 1

" auto close pairs when on separate lines
inoremap {<cr> {<cr>}<esc>O
inoremap [<cr> [<cr>]<esc>O
inoremap (<cr> (<cr>)<esc>O

"prevent signs from opening another gutter
set signcolumn=number

" auto remove trailing whitespace
autocmd BufWritePre * :%s/\s\+$//e

" enable resizing splits in tmux
if has("mouse_sgr")
    set ttymouse=sgr
else
    set ttymouse=xterm2
end

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

" default width value for goyo
let g:goyo_width=100

" highlight misspelled words in markdown files
autocmd FileType markdown setlocal spell

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
nnoremap <S-k> :bd<cr>

" window navigation
nnoremap <tab> <C-w>w
nnoremap <S-tab> <C-w>W
nnoremap <C-p> <C-i>
nnoremap <leader>v :vsp<cr>

" show tagbar
nnoremap <F8> :TagbarToggle<CR>

" quickfix navigation
nnoremap <leader>c :copen 30<cr>
nnoremap [q :cprevious<cr>zz
nnoremap ]q :cnext<cr>zz

" search highlighting
noremap <cr> :noh<cr><cr>

" fzf searches
nnoremap <leader>f :FZF<cr>
nnoremap <nowait><leader>b :Buffers<cr>

" writing
nnoremap <leader>g :Goyo<cr>
nnoremap <leader>t :Toc<cr>
nnoremap <leader>d :ThesaurusQueryLookupCurrentWord<cr>

" Jump list (to newer position)
nnoremap <C-p> <C-i>

" search for word under cursor, including first word
nnoremap * *N

" easy search and replace
" nnoremap <C-h> :%s//gc<left><left><left>
nnoremap <C-f> :vimgrep '' **/*<left><left><left><left><left><left>

" easy edits
nnoremap <leader>ev :e ~/.vim/vimrc<cr>
nnoremap <leader>so :so %<cr>
nnoremap <leader>eb :e ~/.bashrc<cr>
nnoremap <leader>et :e ~/.tmux.conf<cr>
nnoremap <leader>es :e ~/.vim/UltiSnips/python.snippets<cr>

" open the pyp directory
nnoremap <leader>p :Ex /home/james/pyp<cr>

" toggle spell check
nnoremap <leader>ss :set spell!<cr>

" toggle line wrap
nnoremap <leader>sw :set wrap!<cr>

" insert text
func Eatchar(pat)
    let c = nr2char(getchar(0))
    return (c =~ a:pat) ? '' : c
endfunc
iab icd ## <c-r>=strftime('%Y-%m-%d')<cr>
iab ppr from pprint import pprint<cr>pprint()<left><c-r>=Eatchar('\s')<cr>
iab pr print()<left><c-r>=Eatchar('\s')<cr>
iab cl console.log();<left><left><c-r>=Eatchar('\s')<cr>
iab dd import config.helpers as helpers<cr>return helpers.dump()<left><c-r>=Eatchar('\s')<cr>

" search for visually selected text
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>N

" reload django apps
nnoremap <F5> :silent !touch config/wsgi.py<cr>

vnoremap <F9> g<C-g>

