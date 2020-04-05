set nu rnu

set hlsearch
set incsearch

set ignorecase
set smartcase

syntax on

let mapleader=" "

nmap <c-n> gt
nmap <c-P> gT

nmap <Leader>q :q<CR>
nmap <Leader>w :w<CR>

filetype plugin indent on

set title

if has('persistent_undo')
	set undofile
	set undodir=$HOME/.vim_undo
	set undolevels=5000
endif
