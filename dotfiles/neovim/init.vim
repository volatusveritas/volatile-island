call plug#begin()  " Begin plugin list definition

"[Reason] Gruvbox is one of the best and cleanest themes for coding
"applications. Doesn't stress the eye, and the colors work very well together
"and are pretty in general.
Plug 'morhetz/gruvbox'
"[Extra] In some cases, you don't need to have gruvbox in (neo)vim, because the
"colors are managed by the terminal; in these cases, a terminal theme can be
"used instead to achieve the same result, often times in a cleaner manner.

"[Reason] Treesitter makes syntax highlighting at least twice as good for most
"if not all syntaxes and languages I've managed to use it with so far. Instead
"of just highlighting special keywords and such, it attributes a special color
"for identifiers, function names and things like that.
Plug 'nvim-treesitter/nvim-treesitter'

"[Reason] Very nice autocompletion plugin for vim in general. Easy to map keys
"into its special functions, makes exploring code extremely easy with the <jump
"to definition> and <get references> functions. Supports many languages.
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"[Extra] It seems to have way too many features and I don't know most of them,
"so I'm most probably not using it as well as I possibly could.

"[Reason] Much easier to understand nesting context with indentation lines and
"guides.
Plug 'lukas-reineke/indent-blankline.nvim'
"[Extra] It acts a bit strange with syntaxes that lack explicit delimiters,
"like Python and GDScript.

"[Reason] Being able to quickly (un)comment a fraction of the code is an
"extremely useful ability, especially for testing and debugging in some
"specific cases.
Plug 'tpope/vim-commentary'
"[Extra] This is a must for any source code editor, and it's a shame (neo)vim
"doesn't ship with it natively.

"[Reason] Nice for surrounding elements with symbols (markup tags especially).
"Most of the mappings feel natural to use and make sense so it goes well with
"(neo)vim's overall style.
Plug 'tpope/vim-surround'
"[Extra] It's still faster for me to manually surround elements sometimes. The
"most probable reason is I haven't got used to the mappings yet (some of them
"don't make much sense to me and I'm bad at memorizing already).

"[Reason] The two following plugins alter the status line below the currently
"edited window. I like how much information it's able to show without making it
"overcrowded with text. One other thing I love about it is how it works out of
"the box.
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"[Extra] I've explored some statusline plugins, like powerline, and I don't
"know if there are better alternatives, but airline seems pretty solid. I
"believe there's still much to learn about it, and I plan on making my own
"theme for it in the future. Airline-themes is necessary to use a
"gruvbox-compatible theme for the statusline's colors. That's my workaround for
"now, until I actually make a gruvbox theme.

"[Reason] Nvim-tree is great to explore files inside (neo)vim, and I'd even go
"as for as to say it's much better than the native file explorer that comes
"packed with the standard install. The mappings make sense and are pretty
"useful. It's easy to set up as well. Mapping <C-n> to toggle it was genius.
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'
"[Extra] Web-devicons is necessary to show the special folder/programming
"language/special icon for the tree explorer. I'm not sure Nerd font icons are
"enough to make this unnecessary, though.

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'nvim-lua/plenary.nvim'
Plug 'folke/todo-comments.nvim'
Plug 'folke/zen-mode.nvim'
Plug 'folke/twilight.nvim'
Plug 'andweeb/presence.nvim'
Plug 'vimwiki/vimwiki'
Plug 'chrisbra/Colorizer'
Plug 'tpope/vim-fugitive'
Plug 'takac/vim-hardtime'
Plug 'dcampos/nvim-snippy'
Plug 'klen/nvim-config-local'
call plug#end()  " End plugin list definition


" Lua setups
lua << EOF
    require'nvim-treesitter.install'.compilers = { "clang" }
    require'nvim-treesitter.configs'.setup { highlight = { enable = true } }
    require'nvim-tree'.setup()
    require'nvim-tree'.setup { auto_close = true, indent_markers = 1 }
    require'todo-comments'.setup()
    require'zen-mode'.setup()
    require'twilight'.setup()
    require'config-local'.setup()
EOF


" Misc variable settings
let mapleader=" "

let g:airline_theme='minimalist'

let g:indent_blankline_use_treesitter = v:true
let g:indent_blankline_show_current_context = v:true

let g:presence_main_image = "neovim"

let g:colorizer_auto_filetype='css,html'


" Option settings
" " Value-set
" nearest include/ folder is searched in goto file
set path=.,include,
" Tab counts as 4 spaces
set tabstop=4
" lines that trespass the 79 character count break
set textwidth=79
" always keep at least 10 lines above and below the cursor
set scrolloff=10
" each step of (auto)indent uses 4 spaces
set shiftwidth=4
" the 80th column is highlighted
set colorcolumn=80
" text is auto wrapped based on textwidth
set formatoptions+=t
" always use the clipboard for all operations
set clipboard=unnamedplus

" " Static set/unset
" special character text markers are shown
set list
" current line number is shown to the left
set number
" lines are not wrapped (in display) if they exceed textwidth
set nowrap
" when using capital letters, do case sensitive search
set smartcase
" Tab is expanded to spaces according to tabstop/shiftwidth
set expandtab
" split command splits to the right
set splitright
" cursor line is highlighted for easy localization
set cursorline
" ignore casing by default when searching
set ignorecase
" 24b RGB color is enabled
set termguicolors 
" relative line distance to current line is displayed in other lines
set relativenumber

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


" NvimSnippy
imap <expr> <Tab> snippy#can_expand_or_advance() ? '<Plug>(snippy-expand-or-advance)' : '<Tab>'
imap <expr> <S-Tab> snippy#can_jump(-1) ? '<Plug>(snippy-previous)' : '<S-Tab>'
smap <expr> <Tab> snippy#can_jump(1) ? '<Plug>(snippy-next)' : '<Tab>'
smap <expr> <S-Tab> snippy#can_jump(-1) ? '<Plug>(snippy-previous)' : '<S-Tab>'
xmap <Tab> <Plug>(snippy-cut-text)
