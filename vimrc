set nu rnu

set hlsearch
set incsearch

set ignorecase
set smartcase

set tabstop=4
set shiftwidth=4
set expandtab

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

function MapRussianKbLaoyout()
    let kb_layout_lower = {"й": "q", "ц": "w", "у": "e", "к": "r", "е": "t", "н": "y", "г": "u", "ш": "i", "щ": "o", "з": "p", "х": "[", "ъ": "]", "ф": "a", "ы": "s", "в": "d", "а": "f", "п": "g", "р": "h", "о": "j", "л": "k", "д": "l", "ж": ";", "э": "'", "я": "z", "ч": "x", "с": "c", "м": "v", "и": "b", "т": "n", "ь": "m", "б": ",", "ю": ".", "ё": "`", "Й": "Q", "Ц": "W", "У": "E", "К": "R", "Е": "T", "Н": "Y", "Г": "U", "Ш": "I", "Щ": "O", "З": "P", "Х": "{", "Ъ": "}", "Ф": "A", "Ы": "S", "В": "D", "А": "F", "П": "G", "Р": "H", "О": "J", "Л": "K", "Д": "L", "Ж": ":", "Э": "\"", "Я": "Z", "Ч": "X", "С": "C", "М": "V", "И": "B", "Т": "N", "Ь": "M", "Б": "<", "Ю": ">", "Ё": "~"}

    for [rus, eng] in items(kb_layout_lower)
        execute "nmap" rus eng
        execute "omap" rus eng
    endfor
endfunction

call MapRussianKbLaoyout()
