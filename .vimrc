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
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'kien/ctrlp.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'bling/vim-bufferline'
Plugin 'tpope/vim-fugitive'
Plugin 'Valloric/YouCompleteMe'
Plugin 'suan/vim-instant-markdown'
Plugin 'ervandew/ag'

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
set mouse=a

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

" markdown settings
au BufNewFile,BufFilePre,BufRead *.md set filetype=markdown
au BufRead,BufNewFile *.md setlocal textwidth=80
autocmd BufRead,BufNewFile *.md setlocal spell spelllang=en_us
set complete+=kspell

" The Silver Searcher
if executable('ag')
    " Use ag over grep
    set grepprg=ag\ --nogroup\ --nocolor

    " Use ag in CtrlP for listing files. Lightning fast and respects
    " .gitignore
    let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden
          \ --ignore .git
          \ --ignore .svn
          \ --ignore .hg
          \ --ignore .DS_Store
          \ --ignore "**/*.pyc"
          \ -g ""'

    " ag is fast enough that CtrlP doesn't need to cache
    let g:ctrlp_use_caching = 0
endif

" turn on vim wildmenu
set wildmenu
set wildmode=longest:full,full

nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" YouCompleteMe
let g:ycm_autoclose_preview_window_after_completion = 1

" Hide tmux status bar when entering vim.
" autocmd VimEnter,VimLeave * silent !tmux set status

" highlight the 120 column
set colorcolumn=120

" vim splits
noremap <C-J> <C-W><C-J>
noremap <C-K> <C-W><C-K>
noremap <C-L> <C-W><C-L>
noremap <C-H> <C-W><C-H>

set splitbelow
set splitright
