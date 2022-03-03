" Vim-plug setups
call plug#begin()
Plug 'morhetz/gruvbox'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'dbeniamine/cheat.sh-vim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'nvim-lua/plenary.nvim'
Plug 'folke/todo-comments.nvim'
Plug 'folke/zen-mode.nvim'
Plug 'folke/twilight.nvim'
Plug 'andweeb/presence.nvim'
Plug 'vimwiki/vimwiki'
Plug 'ap/vim-css-color'
Plug 'tpope/vim-fugitive'
Plug 'takac/vim-hardtime'
call plug#end()


" Lua setups
lua << EOF
    require'nvim-treesitter.install'.compilers = { "clang" }
    require'nvim-treesitter.configs'.setup { highlight = { enable = true } }
    require'nvim-tree'.setup()
    require'nvim-tree'.setup { auto_close = true, indent_markers = 1 }
    require'todo-comments'.setup()
    require'zen-mode'.setup()
    require'twilight'.setup()
EOF


" Misc variable settings
let mapleader=" "

let g:airline_theme='minimalist'

let g:indent_blankline_use_treesitter = v:true
let g:indent_blankline_show_current_context = v:true

let g:presence_main_image = "neovim"


" Option settings
" " Value-set
set path=.,include,        " nearest include/ folder is searched in goto file
set tabstop=4              " Tab counts as 4 spaces
set textwidth=79           " lines that trespass the 79 character count break
set scrolloff=10           " always keep at least 10 lines above and below the cursor
set shiftwidth=4           " each step of (auto)indent uses 4 spaces
set colorcolumn=80         " the 80th column is highlighted
set formatoptions+=t       " text is auto wrapped based on textwidth
set clipboard=unnamedplus  " always use the clipboard for all operations

" " Static set/unset
set list                   " special character text markers are shown
set number                 " current line number is shown to the left
set nowrap                 " lines are not wrapped (in display) if they exceed textwidth
set smartcase              " when using capital letters, do case sensitive search
set expandtab              " Tab is expanded to spaces according to tabstop/shiftwidth
set splitright             " split command splits to the right
set cursorline             " cursor line is highlighted for easy localization
set ignorecase             " ignore casing by default when searching
set termguicolors          " 24b RGB color is enabled
set relativenumber         " relative line distance to current line is displayed in other lines

" " Special settings
colorscheme gruvbox
highlight Normal guibg=NONE ctermbg=NONE
filetype plugin on


" Key (re)mappings
tnoremap <Esc> <C-\><C-n>
nnoremap <C-n> :NvimTreeToggle<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>
nnoremap <leader>n :NvimTreeFindFile<CR>
noremap <A-Right> gt
noremap <A-Left> gT
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>rn <Plug>(coc-rename)
map <C-z> :ZenMode<CR>


" TEMPORARY (COC CONFIG EXPLICIT)
" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Use <C-j> for both expand and jump (make expand higher priority)
imap <C-j> <Plug>(coc-snippets-expand-jump)
