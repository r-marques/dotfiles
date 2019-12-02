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
Plugin 'bling/vim-bufferline'
Plugin 'tpope/vim-fugitive'
Plugin 'suan/vim-instant-markdown'
Plugin 'ervandew/ag'
Plugin 'flazz/vim-colorschemes'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'Raimondi/delimitMate'
Plugin 'janko-m/vim-test'
Plugin 'airblade/vim-gitgutter'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'ervandew/supertab'
Plugin 'junegunn/goyo.vim'
Plugin 'rust-lang/rust.vim'
Plugin 'morhetz/gruvbox'
Plugin 'itchyny/lightline.vim'
Plugin 'euclio/vim-markdown-composer'
Plugin 'majutsushi/tagbar'
Plugin 'w0rp/ale'
Plugin 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
Plugin 'ncm2/ncm2'
Plugin 'roxma/nvim-yarp'
Plugin 'ncm2/ncm2-bufword'
Plugin 'ncm2/ncm2-tmux'
Plugin 'ncm2/ncm2-path'
Plugin 'junegunn/fzf.vim'
Plugin 'airblade/vim-rooter'

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

" colorscheme
set background=dark
colorscheme gruvbox
highlight Normal ctermbg=none

" NerdTree
map <F2> :NERDTreeToggle<CR>
let NERDTreeIgnore = ['\.pyc$', '__pycache__', '\.egg-info$', '\.cache$', '\.mypy_cache$', '\.pants\.d$', '\.pytest_cache$', '.git$', '\.pids$']
let NERDTreeShowHidden=1

" lightline
set laststatus=2
set noshowmode
let g:lightline = {
    \ 'colorscheme': 'seoul256',
    \ }

" Buffer management
map <leader>l :bnext<CR>
map <leader>h :bprevious<CR>
map <leader>q :bp <BAR> bd #<CR>
set hidden

" markdown settings
au BufNewFile,BufFilePre,BufRead *.md set filetype=markdown
au BufRead,BufNewFile *.md setlocal textwidth=79
autocmd BufRead,BufNewFile *.md setlocal spell spelllang=en_us
set complete+=kspell

" The Silver Searcher
if executable('ag')
    " Use ag over grep
    set grepprg=ag\ --nogroup\ --nocolor

endif

" turn on vim wildmenu
set wildmenu
set wildmode=longest:full,full

nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" highlight the 100 column
set colorcolumn=100
au BufRead,BufNewFile *.rs setlocal colorcolumn=100

" vim splits
noremap <C-J> <C-W><C-J>
noremap <C-K> <C-W><C-K>
noremap <C-L> <C-W><C-L>
noremap <C-H> <C-W><C-H>

set splitbelow
set splitright

let g:python3_host_prog = '/usr/bin/python3'

" ultisnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" tagbar
nmap <F8> :TagbarToggle<CR>

" highlight trailing whitespaces
:highlight ExtraWhitespace ctermbg=red guibg=red
:match ExtraWhitespace /\s\+$/

" LanguageClient
let g:LanguageClient_autoStart = 1
let g:LanguageClient_serverCommands = {
    \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
    \ }

nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> <F3> :call LanguageClient_textDocument_references()<CR>
" disable linter (it is handled by ale)
let g:LanguageClient_diagnosticsEnable = 0

" ncm2
autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=noinsert,menuone,noselect

" fzf
map <C-p> :Files<CR>
nmap <leader>; :Buffers<CR>

" Permanent undo
set undodir=~/.vimdid
set undofile

" ale
" let g:ale_linters = {'rust': ['rls']}
let g:ale_linters = {
    \ 'python': ["pylint", "mypy", "yapf"],
    \ 'rust': ['rls', 'clippy'],
\ }
let g:ale_fixers = {
    \ 'python': ["black"],
    \ 'rust': ['fmt'],
    \ 'html': ['tidy'],
\ }
let g:ale_rust_cargo_check_all_targets = 1
let g:ale_rust_cargo_check_tests = 1
let g:ale_rust_cargo_check_examples = 1
let g:ale_sign_column_always = 1

" set spell checking. It should only be enabled for comments
set spell spelllang=en_us

" allows the use of `w!!` to override readonly restriction
" for instance when opening a file without sudo
" https://dev.to/jovica/the-vim-trick-which-will-save-your-time-and-nerves-45pg
cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!
