
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
Plug 'sainnhe/edge'


" ---------------------------------------
" interface
" ---------------------------------------
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-surround'


" ---------------------------------------
" behavior / tools
" ---------------------------------------

"  auto save
Plug 'vim-scripts/vim-auto-save'

" comment bindings
Plug 'tpope/vim-commentary'

" covert camel case to snake case etc.
Plug 'tpope/vim-abolish'

" auto update tags file
Plug 'ludovicchabant/vim-gutentags'

" run django reload script without screen blank
Plug 'fcpg/vim-altscreen'

" better autocomplete, always on
Plug 'maralla/completor.vim'

" code validation
Plug 'maralla/validator.vim'

" python folding
Plug 'kalekundert/vim-coiled-snake'

" highlight matching html tags
Plug 'valloric/MatchTagAlways'

" auto close html tags
Plug 'alvan/vim-closetag'

" auto sort python imports
Plug 'fisadev/vim-isort'



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

syntax enable


" ---------------------------
" seoul256 light
" ---------------------------
"   Range:   252 (darkest) ~ 256 (lightest)
"   Default: 253
" ---------------------------
let g:seoul256_background = 255
let g:airline_theme='zenburn'
set background=light
colorscheme seoul256-light


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
"
filetype plugin on

" enable mouse usage
set mouse=a

" no swap files
set noswapfile

" search
" set ignorecase
set smartcase
set incsearch
" set hlsearch

" open splits on the right and bottom
set splitright
set splitbelow

"# fold behavior
set foldmethod=indent
set foldlevel=99

" autosave
let g:auto_save = 1
let g:auto_save_in_insert_mode = 0

" tabs
set expandtab       "inserts spaces when tab key is pressed
set tabstop=4       "sets for spaces for tabs
set shiftwidth=4    "sets number of spaces to insert/remove using indentation commands
set softtabstop=4   "number of spaces removed by backspace key
set autoindent
filetype plugin indent on
set shiftround      " use multiple of shiftwidth when indenting with '<' and '>'

" html mode
autocmd BufRead,BufNewFile *.html,*.css setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd BufRead,BufNewFile *.html set filetype=htmldjango
autocmd BufRead,BufNewFile *.html set foldmethod=indent

" markdown mode
let g:vim_markdown_toc_autofit = 1
autocmd BufRead,BufNewFile *.mkd setlocal wrap
autocmd BufRead,BufNewFile *.mkd setlocal spell
autocmd BufRead,BufNewFile *.mkd setlocal nonumber
autocmd BufRead,BufNewFile *.mkd setlocal breakindent
autocmd BufRead,BufNewFile *outline.mkd setlocal briopt=shift:2


" backspace
set backspace=indent,eol,start

" disable fzf preview window
let g:fzf_preview_window = ''

" persistent undo history
set undofile
set undodir=~/.vim/undodir

set wildignore+=tags,.git/**
set wildignore+=**/migrations/**,**/__pycache__/**
" set wildignore+=**/__pycache__/**
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
set nowrap

" break at whitespace not words
set linebreak

" show partial lines at the bottom of the screen
set display=lastline

" eliminate delay leaving insert mode
set ttimeoutlen=50

" default width value for goyo
let g:goyo_width=100


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
nnoremap 0 g0
nnoremap $ g$
vnoremap j gj
vnoremap k gk

" easy scrolling
nnoremap M <C-d>
nnoremap U <C-u>

" delete a word in insert mode
inoremap <C-b> <C-w>

" tab and untab in insert mode
inoremap <C-n> <C-t>
inoremap <C-b> <C-d>

" easy exits
nnoremap <S-k> :bd<cr>
nnoremap <C-d> :q!<cr>

" window navigation
nnoremap <tab> <C-w>w
nnoremap <S-tab> <C-w>W
nnoremap <C-p> <C-i>
nnoremap <leader>v :vsp<cr>

" quickfix navigation
nnoremap <leader>c :copen 30<cr>
nnoremap [q :cprevious<cr>zz
nnoremap ]q :cnext<cr>zz

" search highlighting
" noremap <cr> :noh<cr>
nnoremap <leader><space> :set hlsearch!<cr>

" fzf searches
nnoremap <leader>f :FZF<cr>
nnoremap <nowait><leader>b :Buffers<cr>

" writing
nnoremap <leader>g :Goyo<cr>
nnoremap <leader>t :Toc<cr>
nnoremap <leader>d :ThesaurusQueryLookupCurrentWord<cr>

" search for word under cursor, including first word
nnoremap * *N

" easy search and replace
nnoremap <C-f> :vimgrep '' **/*<left><left><left><left><left><left>

" easy edits
nnoremap <leader>ev :e ~/.vim/vimrc<cr>
nnoremap <leader>so :so %<cr>
nnoremap <leader>eb :e ~/.bashrc<cr>
nnoremap <leader>et :e ~/.tmux.conf<cr>

" search for visually selected text
vnoremap * y/\V<C-R>=escape(@",'/\')<CR><CR>N


" ----------------------------------------------------------------------------
" Text Insertion
" ----------------------------------------------------------------------------

:nnoremap <leader>p obreakpoint()<Esc>

" insert text
func Eatchar(pat)
    let c = nr2char(getchar(0))
    return (c =~ a:pat) ? '' : c
endfunc

iab icd ### <c-r>=strftime('%Y-%m-%d')<cr>
iab ppr from pprint import pprint<cr>pprint()<left><c-r>=Eatchar('\s')<cr>
iab pr print()<left><c-r>=Eatchar('\s')<cr>
iab br breakpoint()<c-r>=Eatchar('\s')<cr>
iab cl console.log();<left><left><c-r>=Eatchar('\s')<cr>
iab dd import config.helpers as helpers<cr>return helpers.dump()<left><c-r>=Eatchar('\s')<cr>
iab docs """<cr><cr>Args:<cr>    id (int):<cr><bs><cr>Returns:<cr><cr>Notes:<cr><cr>"""<up><up><up><up><up><up><up><up><up><c-r>=Eatchar('\s')<cr>
iab css /*------------------------------------------------<cr><cr>------------------------------------------------*/


" save as root
command W :execute ':silent w !sudo tee % > /dev/null' | :edit!


