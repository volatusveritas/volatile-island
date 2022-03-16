call plug#begin()  " Begin plugin list definition

"[Reason] Gruvbox is one of the best and cleanest themes for coding
"applications. Doesn't stress the eye, and the colors work very well together
"and are pretty in general. I use it consistently throughout multiple projects,
"editors and software in general, so the colors become predictable and
"familiar, resulting in their meaning being easily identifiable.
    Plug 'morhetz/gruvbox'
"[Extra] In some cases, you don't need to have gruvbox in (neo)vim, because the
"colors are managed by the terminal; in these cases, a terminal theme can be
"used instead to achieve the same result, often times in a cleaner manner.

"[Reason] Treesitter makes syntax highlighting at least twice as good for most
"if not all syntaxes and languages I've managed to use it with so far. Instead
"of just highlighting special keywords and such, it attributes a special color
"to identifiers, function names and things like that, making coding a much
"easier task.
    Plug 'nvim-treesitter/nvim-treesitter'

"[Reason] Very nice autocompletion plugin for vim in general. Easy to map keys
"into its special functions, makes exploring code extremely easy with the <jump
"to definition> and <get references> functions. Supports many languages. It's
"especially useful in big files where I need to be jumping around all the time,
"in which case I can simply 'jump to definition' and use <C-o> to go back to
"where I was.
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
"[Extra] It seems to have way too many features and I don't know most of them,
"so I'm most probably not using it as well as I possibly could. I also lacks
"support for some languages, and some of the languages it supports lack
"important features, rendering it mostly useless in these cases.

"[Reason] Much easier to understand nesting context with indentation lines and
"guides. It can also be a guide for complexity, because if you see too many
"indentation lines it probably means you're making a god function/class. It's
"also easy to tweak and customize.
    Plug 'lukas-reineke/indent-blankline.nvim'
"[Extra] It acts a bit strange with syntaxes that lack explicit delimiters,
"like Python and GDScript, which generally results in it not generating
"indentation lines at all or just generating them forever until another scope
"starts.

"[Reason] Being able to quickly (un)comment a fraction of the code is an
"extremely useful ability, especially for testing and debugging in some
"specific cases. Commands like `gcgc` also make it easy to uncomment a bunch of
"lines without having to manually select them.
    Plug 'tpope/vim-commentary'
"[Extra] This is a must for any source code editor, and it's a shame (neo)vim
"doesn't ship with it natively. Still, Tim Pope did a nice job with this one.

"[Reason] Nice for surrounding elements with symbols (markup tags especially).
"Most of the mappings feel natural to use and make sense so it goes well with
"(neo)vim's overall style. It's extremely simple to turn something into a
"argument for a function call, place code inside brackets as a function body,
"and edit surrounded text in general.
    Plug 'tpope/vim-surround'
"[Extra] Some of the commands can be a bit confusing especially because they
"conflict somewhat with existing shortcuts and commands, like how you have to
"use capital S instead of s to surround in Visual mode. It takes a bit of
"getting used to, but it's totally worth it in the end.

"[Reason] The two following plugins alter the status line below the currently
"edited window. I like how much information it's able to show without making it
"overcrowded with text. One other thing I love about it is how it works out of
"the box, and from the GitHub page's Wiki, it seems to be extremely
"customizable and configurable.
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"[Extra] I've explored some statusline plugins, like powerline, and I don't
"know if there are better alternatives, but airline seems pretty solid. I
"believe there's still much to learn about it, and I plan on making my own
"theme for it in the future. Airline-themes is necessary to use a
"gruvbox-compatible theme for the statusline's colors. That's my workaround for
"now, until I actually make a gruvbox theme. It also impacts performance a bit
"but it's nothing big enough to be an actual concern.

"[Reason] Nvim-tree is great to explore files inside (neo)vim, and I'd even go
"as for as to say it's much better than the native file explorer that comes
"packed with the standard install. The mappings make sense and are pretty
"useful. It's easy to set up as well.
    Plug 'kyazdani42/nvim-web-devicons'
    Plug 'kyazdani42/nvim-tree.lua'
"[Extra] Web-devicons is necessary to show the special folder/programming
"language/icon for the tree explorer. I'm not sure if Nerd font icons are
"enough to make this unnecessary, though. <C-n> is mapped to toggle the tree. I
"got this tip from docs, and it's absolutely genious.

"[Reason] FzF is a great command-line fuzzy finder. Making it accessible from
"(neo)vim makes it pure gold. I expect my personal and non personal projects
"alike to increase in size and complexity very soon, and even more in the
"future, hence the usefulness of this plugin will probably increase over time.
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
"[Extra] fzf.vim is the way to use fzf inside vim (fzf is not originally a vim
"plugin), so the two walk alongside each other.

"[Reason] Plenary is a collection of useful neovim functions which other
"plugins either rely on or make use of.
    Plug 'nvim-lua/plenary.nvim'
"[Extra] Keeping plenary updated alongside its dependants is uf utmost
"importance, because newer versions of other plugins may use new functions from
"plenary, and if it's not updated, things will break.

"[Reason] Todo comments (and comment marks in general) are a simply but quite
"effective way of annotating code with marks that can be later jumped to or
"searched for (the `TodoQuickFix` command is glorious, by the way).
    Plug 'folke/todo-comments.nvim'

"[Reason] The two following plugins complement each other. Zen-mode is used to
"bring one of the opened windows to focus and make it easier to concentrate on
"editing a specific file (hence the name zen-mode). Twilight, in addition, dims
"parts of the code it doesn't find belong to the group of lines being edited
"currently, making for a great experience.
    Plug 'folke/zen-mode.nvim'
    Plug 'folke/twilight.nvim'
"[Extra] <C-z> is mapped to toggle zen mode in the file being edited currently,
"and I'm still getting used to this mapping as it's something so significantly
"different in other editors.

"[Reason] Shows people on Discord if I'm editing some file, in which project
"I'm doing so, what file I'm editing and for how long I've been doing it. This
"has two use cases: a) most people won't send me messages because they know I'm
"busy, and the ones that do send messages expect to not be answered instantly.
    Plug 'andweeb/presence.nvim'
"[Extra] There's more to tweak than I've messed with, but I don't think
"additional setup is necessary, at least for now.

"[Reason] I had used vim-notes before, but vimwiki is just packed with
"usefulness everywhere. Very nice plugin, easy to set up and use, but takes a
"little getting used to with its more specific and intimate syntax.
    Plug 'vimwiki/vimwiki'

"[Reason] Seeing the colors from color codes is a blessing whenever I have to
"edit things using many colors, because it becomes hard to keep track of which
"color is which and which do and don't go well together.
    Plug 'chrisbra/Colorizer'

"[Reason] It allows me to use Git commands from within Vim, and that's reason
"enough to use it, but it also has additional features for Git manipulation
"that simply compose a great plugin.
    Plug 'tpope/vim-fugitive'

"[Reason] Vim-hardtime is probably the best way to get rid of improductive
"vices in editing by forcing you to do it the right way, and edit consistently
"instead of spamming edits/deletions/changes and banging the movement keys
"instead of abusing Vim's atomicity and using counts instead.
    Plug 'takac/vim-hardtime'

"[Reason] Snippy is a great and simple snippets plugin, easy to customize, set
"up and use. I expect it to become especially useful once I go into the
"territory of editing Battle for Wesnoth files.
    Plug 'dcampos/nvim-snippy'

"[Reason] (Neo)vim has support for loading local vimrcs upon start but
"everywhere I go I read it's unsafe to do so because the contents of said vimrc
"could be damaging. I'm not sure this is extremely useful but it seems a better
"alternative to the native local vimrc loading.
    Plug 'klen/nvim-config-local'

Plug 'tpope/vim-repeat'

Plug 'folke/which-key.nvim'

Plug 'ggandor/lightspeed.nvim'

Plug 'puremourning/vimspector'

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
    require'which-key'.setup()
EOF


" Misc variable settings
let mapleader=" "

let g:airline_theme='minimalist'

let g:indent_blankline_use_treesitter = v:true
let g:indent_blankline_show_current_context = v:true

let g:presence_main_image = "neovim"

let g:colorizer_auto_filetype='css,html'

let g:vimspector_enable_mappings = 'HUMAN'


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
