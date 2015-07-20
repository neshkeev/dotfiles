" ===========================================================
" General vim configuration
" ===========================================================
set relativenumber

set incsearch
set hlsearch

syntax enable
set foldmethod=syntax

set tabstop=4
set softtabstop=4
" step of (auto)indent. Used for >>, <<, etc.
set shiftwidth=4
set noexpandtab
" use the same indent for new line as it was used for the previous one.
set autoindent

set colorcolumn=80
highlight ColorColumn ctermbg=darkgray

" change the mapleader from \ to ,
let mapleader=","

if has('persistent_undo')
	set undofile
	set undodir=$HOME/.vim_undo
	set undolevels=5000
endif

" ===========================================================
" Vundle configuration
" ===========================================================
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" autocomplete
Plugin 'Valloric/YouCompleteMe'

" configs generator for youcompleteme
Plugin 'rdnetto/YCM-Generator'

" configs generator for youcompleteme
Plugin 'jeaye/color_coded'

" automatically close brackets, quotes, etc.
Plugin 'Raimondi/delimitMate'

" automatically close brackets, quotes, etc.
Plugin 'SirVer/ultisnips'

" This Vim plugin will pull C++ ptototypes into the implementation file
Plugin 'derekwyatt/vim-protodef'

" This Vim plugin will help switching between companion files (e.g. .h and .cpp files)
Plugin 'derekwyatt/vim-fswitch'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" ===========================================================
" DelimMate configuration (automatically closing brackets)
" ===========================================================
let delimitMate_expand_cr = 1

" ===========================================================
" YCM configuration
" ===========================================================
" hide preview panes for ycm
autocmd CompleteDone * pclose
" load .ycm_extra_conf.py automatically
let g:ycm_confirm_extra_conf = 0

" ===========================================================
" UltiSnap Configuration
" ===========================================================
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-k>"
let g:UltiSnipsJumpForwardTrigger="<c-k>"
let g:UltiSnipsJumpBackwardTrigger="<s-c-j>"

" ===========================================================
" Protodef configuration
" ===========================================================
" use ,PP to propagate defines to the source file
nmap <buffer> <silent> <leader> ,PP
" ===========================================================
" Fswitch configuration
" ===========================================================
" use ,PP to propagate defines to the source file
nmap <silent> ,cf :FSHere<CR>
nmap <silent> ,sf :FSSplitRight<CR>

" ===========================================================
" My own cmd & remapping
" ===========================================================
" Generate ctags on every save action in *.cpp and *.h files
autocmd BufWritePost *.cpp,*.hpp silent! !ctags -R .
" <leader> + b to force ycm diag
nmap ,b :YcmDiag<CR>
