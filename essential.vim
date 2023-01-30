" ----------------------------------------------------------------------------
" Vim Plug
" ----------------------------------------------------------------------------

call plug#begin('~/.vim/plugged')

Plug 'junegunn/seoul256.vim'
Plug 'tpope/vim-vinegar'
Plug 'SirVer/ultisnips'

call plug#end()

set nocompatible
filetype plugin on

syntax enable
let g:seoul256_background = 254
set background=light
colorscheme seoul256-light

set formatoptions+=c
set formatoptions+=r
set comments-=mb:*
set comments=fb:-,fb:*
set breakindent
set autoindent
set textwidth=78

" ----------------------------------------------------------------------------
" Mappings
" ----------------------------------------------------------------------------

" leader
let mapleader = " "

" escaping
inoremap jj <esc>
inoremap jk <esc>

" search highlighting
noremap <cr> :noh<cr>

" buffer navigation
nnoremap ]b :bnext
nnoremap [b :previous

" easy config
nnoremap <leader>ev :e ~/.vim/essential.vim<cr>

" easy exits
nnoremap <S-k> :bd<cr>
nnoremap <C-d> :wq!<cr>

" window navigation
nnoremap <tab> <C-w>w
nnoremap <S-tab> <C-w>W
nnoremap <C-p> <C-i>


let g:UltiSnipsExpandTrigger="<c-y>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
