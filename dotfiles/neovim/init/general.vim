" Value settings
let g:mapleader = ","
set path=.,include,
set tabstop=4
set textwidth=79
set scrolloff=10
set shiftwidth=4
set colorcolumn=80
set formatoptions+=t
set clipboard=unnamedplus

" Set/unset settings
set list
set number
set nowrap
set smartcase
set expandtab
set splitright
set cursorline
set ignorecase
set termguicolors
set relativenumber

" Theme and appearance
syntax on
set t_Co=256
let g:catppuccin_flavour = "mocha"
colorscheme catppuccin
" " Make background transparent
" highlight Normal guibg=NONE ctermbg=NONE

filetype plugin on

" Plugin options
let g:vimwiki_auto_header = 1
