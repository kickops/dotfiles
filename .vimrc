syntax on
set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)

" ...

Plugin 'morhetz/gruvbox'
Plugin 'davidhalter/jedi-vim'

Plugin 'vim-scripts/indentpython.vim'

Plugin 'vim-syntastic/syntastic'
Plugin 'nvie/vim-flake8'

Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'

Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


set splitbelow
set splitright


"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>


" Enable folding
set foldmethod=indent
nnoremap <space> za

vnoremap <space> zf

" Enable folding with the spacebar
nnoremap <space> za


:let mapleader = ","
" colorscheme molokai
" let g:molokai_original = 1
" let g:rehash256 = 1

set background=dark
colorscheme gruvbox
