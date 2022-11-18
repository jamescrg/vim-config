" ----------------------------------------------------------------------------
" Vim Plug
" ----------------------------------------------------------------------------

call plug#begin('~/.vim/plugged')

Plug 'junegunn/seoul256.vim'

call plug#end()

set nocompatible
filetype plugin on

syntax enable
let g:seoul256_background = 254
set background=light
colorscheme seoul256-light

" escaping
inoremap jj <esc>
inoremap jk <esc>

" search highlighting
noremap <cr> :noh<cr>

" buffer navigation
nnoremap ]b :bnext
nnoremap [b :previous
