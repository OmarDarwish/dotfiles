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
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'easymotion/vim-easymotion'
Plugin 'terryma/vim-smooth-scroll'
Plugin 'edkolev/tmuxline.vim'
Plugin 'tomtom/tcomment_vim'
Plugin 'valloric/youcompleteme'
Plugin 'zxiest/vim-ruby'
Plugin 'tpope/vim-surround'
Plugin 'jiangmiao/auto-pairs'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/syntastic'
Plugin 'pangloss/vim-javascript'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-session'
Plugin 'peterRincker/vim-argumentative'
Plugin 'flazz/vim-colorschemes'
Plugin 'ternjs/tern_for_vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'rking/ag.vim'
Plugin 'moll/vim-node'
Plugin 'janko-m/vim-test'
Plugin 'christoomey/vim-tmux-runner'
Plugin 'tpope/vim-fugitive'
Plugin 'elzr/vim-json'
Plugin 'hashivim/vim-terraform'
Plugin 'taiansu/nerdtree-ag'
Plugin 'AndrewRadev/linediff.vim'
Plugin 'chiedo/vim-sort-blocks-by'


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
map <C-n> :NERDTreeTabsToggle<CR>
map <leader>r :NERDTreeFind<CR>

"Insert lines without entering insert mode
nnoremap <leader>j o<Esc>
nnoremap <leader>k O<Esc>

"General settings
syntax on
set nu
set laststatus=2  "fix vim-airline
set showcmd
set hlsearch
set ignorecase
highlight clear SignColumn
nohlsearch
set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣
set diffopt+=vertical

"Theming
set cursorline
let g:airline_theme='murmur'
set t_Co=256
colorscheme CandyPaper

function! DiffColorToggle()
  if &diff
    colorscheme evening
  else
    if g:colors_name !~ "CandyPaper"
      colorscheme CandyPaper
    endif
  endif
endfunc

autocmd BufEnter,TabEnter * :call DiffColorToggle()

"Sessions
let g:session_autosave='yes'
let g:session_autosave_periodic=5
"Disable auto comment insertion for newline
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

"Scrolling
let g:smooth_scroll_duration=10
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, smooth_scroll_duration, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, smooth_scroll_duration, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, smooth_scroll_duration, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, smooth_scroll_duration, 4)<CR>

"Disable swap files
set noswapfile
set nobackup
set nowb

"Indentation
set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab
set backspace=2

"Mouse
set mouse=a

"Splits
map <leader>" :sp<CR>
map <leader>% :vsp<CR>

"Toggle between relative and absolute line numbering
function! NumberToggle()
  if(&relativenumber == 1)
    set number
    set norelativenumber
  else
    set relativenumber
  endif
endfunc

map <leader>m :call NumberToggle()<cr>

"Set line relative number in visual modes
nnoremap <silent> v v:<C-u>set nonu rnu<CR>gv
nnoremap <silent> V V:<C-u>set nonu rnu<CR>gv
nnoremap <silent> <C-v> <C-v>:<C-u>set nonu rnu<CR>gv

"Search highlighting
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>

"Syntastic quickstart settings
let g:syntastic_ruby_checkers = ['rubocop']
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_error_symbol = "✗"
let g:syntastic_warning_symbol = "⚠"
let g:syntastic_style_error_symbol = "✗"
let g:syntastic_style_warning_symbol = "⚠"

" Conceal settings
set conceallevel=2

" Update Settings (vim gitgutter)
set updatetime=250

" Vim Test
let g:test#strategy = 'vtr'
let test#javascript#jasmine#file_pattern = 'spec.js'
let test#javascript#jasmine#executable = 'jasmine-node'
let test#javascript#jasmine#options = '--forceexit'
let test#javascript#mocha#file_pattern = 'spec.js'
let test#javascript#mocha#executable = 'NODE_ENV=test mocha'
let test#javascript#mocha#options = "--require 'spec/helpers/init.js'"
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>
