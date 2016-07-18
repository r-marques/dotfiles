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
Plugin 'vim-airline/vim-airline-themes'
Plugin 'bling/vim-bufferline'
Plugin 'tpope/vim-fugitive'
Plugin 'suan/vim-instant-markdown'
Plugin 'ervandew/ag'
Plugin 'flazz/vim-colorschemes'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'Raimondi/delimitMate'
Plugin 'janko-m/vim-test'
Plugin 'airblade/vim-gitgutter'
Plugin 'Shougo/deoplete.nvim'
Plugin 'zchee/deoplete-jedi'
Plugin 'zchee/deoplete-clang'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

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
" let g:airline_theme = 'solarized'

" Buffer management
map <leader>l :bnext<CR>
map <leader>h :bprevious<CR>
map <leader>q :bp <BAR> bd #<CR>
set hidden

" markdown settings
au BufNewFile,BufFilePre,BufRead *.md set filetype=markdown
au BufRead,BufNewFile *.md setlocal textwidth=120
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
let g:ycm_global_ycm_extra_conf = '/home/rodmar/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'

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

" deoplete
let g:deoplete#enable_at_startup = 1

" deoplete-jedi
let g:jedi#completions_enabled = 0
let g:jedi#auto_vim_configuration = 0
let g:jedi#smart_auto_mappings = 0
let g:jedi#show_call_signatures = 0
 
" deoplete-clang
let g:deoplete#sources#clang#libclang_path = '/usr/lib64/libclang.so'
let g:deoplete#sources#clang#clang_header = '/usr/lib/clang/3.7.0/include'

let g:python3_host_prog = '/usr/bin/python3'

" ultisnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
