
" ----------------------------------------------------------------------------
" Vim Plug
" ----------------------------------------------------------------------------

call plug#begin('~/.vim/plugged')

" ---------------------------------------
" color schemes
" ---------------------------------------
Plug 'junegunn/seoul256.vim'
Plug 'morhetz/gruvbox'


" ---------------------------------------
" core interface improvements
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

" change brackets, parents, quotes, html tags
Plug 'tpope/vim-surround'

" repeat plugin actions
Plug 'tpope/vim-repeat'

" covert camel case to snake case etc.
Plug 'tpope/vim-abolish'

" auto update tags file
Plug 'ludovicchabant/vim-gutentags'

" better autocomplete, always on
Plug 'maralla/completor.vim'

" code validation
Plug 'maralla/validator.vim'

" highlight matching html tags
Plug 'valloric/MatchTagAlways'

" automatically close html tags
" when attempting to surround something, use vim-surround
Plug 'alvan/vim-closetag'


" ---------------------------------------
" python
" ---------------------------------------

" python folding
Plug 'kalekundert/vim-coiled-snake'

" auto sort python imports
Plug 'fisadev/vim-isort'



call plug#end()


" ----------------------------------------------------------------------------
" Colorscheme
" ----------------------------------------------------------------------------

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

" ---------------------------
" gruvbox
" ---------------------------
" set background=dark
" colorscheme gruvbox
" let g:airline_theme='gruvbox'
" let g:gruvbox_contrast_dark = 'soft'


" ----------------------------------------------------------------------------
" Airline
" ----------------------------------------------------------------------------

autocmd VimEnter * silent AirlineToggleWhitespace


" ----------------------------------------------------------------------------
" Completor
" ----------------------------------------------------------------------------

autocmd Filetype markdown let g:completor_auto_trigger = 0
let g:completor_python_binary = '/home/james/chf/lib/python3.10/site-packages/jedi'

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<cr>"


" ----------------------------------------------------------------------------
" Validator
" ----------------------------------------------------------------------------

let g:validator_python_checkers = ['flake8']
let g:validator_css_checkers = ['csslint']


" ----------------------------------------------------------------------------
" Search
" ----------------------------------------------------------------------------

" ignore case
set ignorecase

" except when an upper case character is used
set smartcase

" start searching as it is typed
set incsearch

" highlight search patterns
set hlsearch


" ----------------------------------------------------------------------------
" Behavior
" ----------------------------------------------------------------------------

set nocompatible

filetype plugin on

" enable mouse usage
set mouse=a

" no swap files
set noswapfile

" open splits on the right and bottom
set splitright
set splitbelow

"# fold behavior
set foldmethod=indent
set foldlevel=1

" autosave
let g:auto_save = 1
let g:auto_save_in_insert_mode = 0

" tabs
set expandtab       " inserts spaces when tab key is pressed
set tabstop=4       " sets for spaces for tabs
set softtabstop=4   " number of spaces removed by backspace key
set shiftwidth=4    " sets number of spaces to insert/remove using indentation commands
set autoindent
set shiftround      " use multiple of shiftwidth when indenting with '<' and '>'

" backspace
set backspace=indent,eol,start

" disable fzf preview window
let g:fzf_preview_window = ''

" elminiate delay in escaping out of fzf
set ttimeoutlen=50

" persistent undo history
set undofile
set undodir=~/.vim/undodir

set wildignore+=tags,.git/**
set wildignore+=**/migrations/**
set wildignore+=**/__pycache__/**
set wildignore+=static/bootstrap-3.3.7/**,static/images/**
set wildignore+=static/admin/**

" hide netrw from buffer-toggle
let g:netrw_altfile = 1

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

" html mode
autocmd BufRead,BufNewFile *.html,*.css setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd BufRead,BufNewFile *.html setlocal filetype=htmldjango
autocmd BufRead,BufNewFile *.html setloca foldmethod=indent


" ----------------------------------------------------------------------------
" Appearance
" ----------------------------------------------------------------------------

" always show line numbers
set number
set relativenumber

"wrap lines
set nowrap

" break at whitespace not words
set linebreak

" show partial lines at the bottom of the screen
set display=lastline


" ----------------------------------------------------------------------------
" Mappings
" ----------------------------------------------------------------------------

" leader
let mapleader = " "

" escaping
inoremap jj <esc>
inoremap jk <esc>

" kill buffer
nnoremap <S-k> :bd<cr>

" exit vim
nnoremap <C-d> :q!<cr>

" pg up/down
nnoremap <C-m> <C-d>

" window navigation
nnoremap <tab> <C-w>w
nnoremap <S-tab> <C-w>W
" nnoremap <C-p> <C-i>
nnoremap <leader>v :vsp<cr>

" clear highlighted search text until next explicit search or n/N
" <silent> - so as to not print :noh on last line when invoked
nnoremap <silent> <cr> :noh<cr>

" fzf searches
nnoremap <leader>f :GFiles<cr>
nnoremap <nowait><leader>b :Buffers<cr>

" search for word under cursor, including first word
nnoremap * *N

" search project
nnoremap <C-f> :vimgrep '' **/*<left><left><left><left><left><left>
nnoremap <leader>c :copen 10<cr>

" search/replace within file
nnoremap <C-h> :%s//gc<left><left><left>

" search for visually selected text
vnoremap * y/\V<C-R>=escape(@",'/\')<CR><CR>N

" shortcuts to edit configuation files
nnoremap <leader>ev :e ~/.vim/vimrc<cr>
nnoremap <leader>so :so %<cr>
nnoremap <leader>eb :e ~/.bashrc<cr>
nnoremap <leader>et :e ~/.tmux.conf<cr>

" shortcut to view log files
nnoremap <leader>l :e /var/log/gunicorn<cr>

" save as root
command W :execute ':silent w !sudo tee % > /dev/null' | :edit!

" insert a breakpoint
nnoremap <leader>p obreakpoint()<Esc>


" ----------------------------------------------------------------------------
" Text Insertion
" ----------------------------------------------------------------------------

" auto close pairs when on separate lines
inoremap {<cr> {<cr>}<esc>O
inoremap [<cr> [<cr>]<esc>O
inoremap (<cr> (<cr>)<esc>O

" close HTML tags when prompted
" just press TAB after the opening tab
inoremap ><Tab> ><Esc>F<lyt>o</<C-r>"><Esc>O<Space>

" insert text
func Eatchar(pat)
    let c = nr2char(getchar(0))
    return (c =~ a:pat) ? '' : c
endfunc

" print
iab pr print()<left><c-r>=Eatchar('\s')<cr>

" pprint
iab ppr from pprint import pprint<cr>pprint()<left><c-r>=Eatchar('\s')<cr>

" python logging
" iab llg import logging<cr>logger = logging.getLogger(__name__)<cr>logger.debug()<left><c-r>=Eatchar('\s')<cr>

" javascript console log
iab cl console.log();<left><left><c-r>=Eatchar('\s')<cr>
"
" dump django objects to browser
iab dd import config.helpers as helpers<cr>return helpers.dump()<left><c-r>=Eatchar('\s')<cr>

" python dosctring
iab pycom """<cr><cr>Args:<cr>    id (int):<cr><bs><cr>Returns:<cr><cr>Notes:<cr><cr>"""<up><up><up><up><up><up><up><up><up><c-r>=Eatchar('\s')<cr>

" css section
iab csscom /*------------------------------------------------<cr><cr>------------------------------------------------*/<up>


function DarkMode()
    if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
    endif
    set background=dark
    colorscheme gruvbox
    let g:airline_theme='gruvbox'
    let g:gruvbox_contrast_dark = 'soft'
endfunction

function LightMode()
    " ---------------------------
    " Seoul256 light
    " ---------------------------
    let g:seoul256_background = 254
    let g:airline_theme='zenburn'
    set background=light
    colorscheme seoul256-light
endfunction

nnoremap<leader>td :call DarkMode()<cr>
nnoremap<leader>tl :call LightMode()<cr>
