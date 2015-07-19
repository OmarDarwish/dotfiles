let mapleader=","
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" User bundles
Bundle 'scrooloose/nerdtree'
Bundle 'jistr/vim-nerdtree-tabs'
Bundle 'bling/vim-airline'
Bundle 'easymotion/vim-easymotion'
Bundle 'terryma/vim-smooth-scroll'
Bundle 'edkolev/tmuxline.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList          - list configured plugins
" :PluginInstall(!)    - install (update) plugins
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"Set NERDtree to open on ctrl+n
map <C-n> :NERDTreeToggle<CR>

"Insert lines without entering insert mode
nnoremap <leader>j o<Esc>
nnoremap <leader>k O<Esc>

"General settings
syntax on
set number
set laststatus=2  "fix vim-airline
set showcmd

"Disable auto comment insertion for newline
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

"Scrolling
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>

"Disable swap files
set noswapfile
set nobackup
set nowb

"Indentation
set autoindent
set smartindent
set smarttab
set shiftwidth=3
set softtabstop=2
set tabstop=2
set expandtab

"Mouse
set mouse=a

"Splits
map <leader>" :sp<CR>
map <leader>% :vsp<CR>
