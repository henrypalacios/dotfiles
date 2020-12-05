" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" Change leader to a comma because the backslash is too far away
" That means all \x commands turn into ,x
" The mapleader has to be set before vundle starts loading all
" the plugins.
let mapleader="\<Space>"

" =============== vim-plug Initialization ===============
call plug#begin('~/.vim/plugged')

" Theme
Plug 'morhetz/gruvbox'

" Search
Plug 'easymotion/vim-easymotion'

" Start Screen
Plug 'mhinz/vim-startify'
" Update session automatically as you exit vim
let g:startify_session_persistence    = 1

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
let NERDTreeQuitOnOpen=1
"let NERDTreeShowHidden=1
let NERDTreeIgnore = ['\.vscode$']

" Status tabline
Plug 'vim-airline/vim-airline'

" Fuzzy Search
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Easily surround things
Plug 'tpope/vim-surround'


call plug#end()


"
"========= nmap plugins ========
nmap <Leader>s <Plug>(easymotion-s2)
nmap <Leader>b :NERDTreeToggle<CR>
nnoremap <C-p> :Files<CR>

" ================ General Config ====================
" Look
colorscheme gruvbox                     
set background=dark
set colorcolumn=80,120

set number                      "Line numbers are good
set list
set listchars=tab:—\ ,eol:¬
set numberwidth=1              "Set number row width
set mouse=a                     "Allow interaciton with mouse
set clipboard=unnamedplus "Copy to clipboard and paste out vim, (*, +) register
set backspace=indent,eol,start  "Allow backspace in insert mode
set history=1000                "Store lots of :cmdline history
set showcmd                     "Show incomplete cmds down the bottom
set showmode                    "Show current mode down the bottom
set showmatch                   "Show the matching bracket
set gcr=a:blinkon0              "Disable cursor blink
set visualbell                  "No sounds
set autoread                    "Reload files changed outside vim
set ruler                       "Add the current line and column"
set encoding=utf-8              "encode files
"set laststatus=2
set rnu

" This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
" http://items.sjbach.com/319/configuring-vim-right
set hidden

"turn on syntax highlighting
syntax enable

" ================ Turn Off Swap Files ==============

set noswapfile
set nobackup
set nowb

" ================ Persistent Undo ==================
" Keep undo history across sessions, by storing in file.
" Only works all the time.
if has('persistent_undo') && !isdirectory(expand('~').'/.vim/backups')
  silent !mkdir ~/.vim/backups > /dev/null 2>&1
  set undodir=~/.vim/backups
  set undofile
endif

" ================ Indentation ======================

set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

" ================ Markdown ==============
let g:vim_markdown_new_list_item_indent = 0

setlocal formatoptions=tqlnrc
set comments=b:>


" Auto indent pasted text
nnoremap p p=`]<C-o>
nnoremap P P=`]<C-o>

filetype plugin on
filetype indent on

"set nowrap       "Don't wrap lines
set linebreak    "Wrap lines at convenient points

" ================ Folds ============================
set foldmethod=indent   "fold based on indent
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "dont fold by default

" ================ Completion =======================

set wildmode=list:longest
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif

"
" ================ Scrolling ========================

set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1

" ================ Search ===========================

set incsearch       " Find the next match as we type the search
set hlsearch        " Highlight searches by default
set ignorecase      " Ignore case when searching...
set smartcase       " ...unless we type a capital

" ================ Shorcut Map Keys ===========================
map <C-a> <esc>ggVG<CR>
map <CR> o<ESC>
map <S-CR> O<ESC>

nmap <Leader>w :w<CR>
nmap <Leader>q :q<CR>
nmap <Leader>x :q!<CR>

" Fast split navigation with <Ctrl> + hjkl.
noremap <c-h> <c-w><c-h>
noremap <c-j> <c-w><c-j>
noremap <c-k> <c-w><c-k>
noremap <c-l> <c-w><c-l>

cmap w!! %!sudo tee > /dev/null

" Paste without copy
nnoremap <leader>d "_d
xnoremap <leader>d "_d
xnoremap <leader>p "_dP
"silent! helptags ALL  " Load help files for all plugins.
