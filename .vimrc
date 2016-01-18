set nocompatible
filetype off

" Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'nvie/vim-flake8'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'bling/vim-bufferline'
Plugin 'tpope/vim-fugitive'
Plugin 'Valloric/YouCompleteMe'

call vundle#end()
filetype plugin indent on


" Main settings
syntax enable
set number
set ts=4
set autoindent
set expandtab
set shiftwidth=4
set showmatch
set encoding=utf-8
let python_highlight_all=1
let mapleader = "\<Space>"

" Solarized
set background=dark
colorscheme solarized

" NerdTree
map <F2> :NERDTreeToggle<CR>
let NERDTreeIgnore = ['\.pyc$', '__pycache__', '\.egg-info$']

" vim-airline
set laststatus=2
let g:airline_powerline_fonts=1

" Buffer management
map <leader>l :bnext<CR>
map <leader>h :bprevious<CR>
map <leader>q :bp <BAR> bd #<CR>
set hidden
