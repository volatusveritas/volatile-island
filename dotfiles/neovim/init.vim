call plug#begin()  " Begin plugin list definition

" Themes
Plug 'morhetz/gruvbox'
Plug 'navarasu/onedark.nvim'

Plug 'andweeb/presence.nvim'
Plug 'chrisbra/Colorizer'
Plug 'dcampos/nvim-snippy'
Plug 'folke/todo-comments.nvim'
Plug 'folke/twilight.nvim'
Plug 'folke/which-key.nvim'
Plug 'folke/zen-mode.nvim'
Plug 'ggandor/lightspeed.nvim'
Plug 'habamax/vim-godot'
Plug 'jlcrochet/vim-razor'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'klen/nvim-config-local'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'p00f/nvim-ts-rainbow'
Plug 'preservim/tagbar'
Plug 'puremourning/vimspector'
Plug 'romgrk/barbar.nvim'
Plug 'takac/vim-hardtime'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vimwiki/vimwiki'

call plug#end()  " End plugin list definition


" Lua setups
lua << EOF
    require'nvim-treesitter.install'.compilers = { "clang" }
    require'nvim-treesitter.configs'.setup {
        highlight = { enable = true },
        rainbow = { enable = true, extended_mode = true, max_file_lines = nil}
    }
    require'nvim-tree'.setup { auto_close = true, indent_markers = 1 }
    require'todo-comments'.setup {}
EOF


" Misc variable settings
let mapleader = " "
let g:airline_theme = 'onedark'
let g:onedark_config = {
    \ 'style': 'dark',
    \ 'code_style': {'comments': 'none'}
\}
let g:indent_blankline_use_treesitter = v:true
let g:indent_blankline_show_current_context = v:true
let g:presence_main_image = "neovim"
let g:colorizer_auto_filetype = 'css,html'
let g:vimspector_enable_mappings = 'HUMAN'
let g:vimwiki_global_ext = 0
let g:tagbar_autofocus = 1


" Option settings
set path=.,include,
set tabstop=4
set textwidth=79
set scrolloff=10
set shiftwidth=4
set colorcolumn=80
set formatoptions+=t
set clipboard=unnamedplus

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

syntax on
set t_Co=256
colorscheme onedark
" Make background transparent
" " highlight Normal guibg=NONE ctermbg=NONE
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


" NvimSnippy
imap <expr> <Tab> snippy#can_expand_or_advance() ? '<Plug>(snippy-expand-or-advance)' : '<Tab>'
imap <expr> <S-Tab> snippy#can_jump(-1) ? '<Plug>(snippy-previous)' : '<S-Tab>'
smap <expr> <Tab> snippy#can_jump(1) ? '<Plug>(snippy-next)' : '<Tab>'
smap <expr> <S-Tab> snippy#can_jump(-1) ? '<Plug>(snippy-previous)' : '<S-Tab>'
xmap <Tab> <Plug>(snippy-cut-text)


" BarBar
" Move to previous/next
nnoremap <silent>    <A-,> :BufferPrevious<CR>
nnoremap <silent>    <A-.> :BufferNext<CR>
" Re-order to previous/next
nnoremap <silent>    <A-<> :BufferMovePrevious<CR>
nnoremap <silent>    <A->> :BufferMoveNext<CR>
" Goto buffer in position...
nnoremap <silent>    <A-1> :BufferGoto 1<CR>
nnoremap <silent>    <A-2> :BufferGoto 2<CR>
nnoremap <silent>    <A-3> :BufferGoto 3<CR>
nnoremap <silent>    <A-4> :BufferGoto 4<CR>
nnoremap <silent>    <A-5> :BufferGoto 5<CR>
nnoremap <silent>    <A-6> :BufferGoto 6<CR>
nnoremap <silent>    <A-7> :BufferGoto 7<CR>
nnoremap <silent>    <A-8> :BufferGoto 8<CR>
nnoremap <silent>    <A-9> :BufferLast<CR>
" Pin/unpin buffer
nnoremap <silent>    <A-p> :BufferPin<CR>
" Close buffer
nnoremap <silent>    <A-c> :BufferClose<CR>
" Magic buffer-picking mode
nnoremap <silent>    <C-s> :BufferPick<CR>
" Sort automatically by...
nnoremap <silent> <Space>bb :BufferOrderByBufferNumber<CR>
nnoremap <silent> <Space>bd :BufferOrderByDirectory<CR>
nnoremap <silent> <Space>bl :BufferOrderByLanguage<CR>
nnoremap <silent> <Space>bw :BufferOrderByWindowNumber<CR>


" Tagbar
nmap <F2> :TagbarToggle<CR>
