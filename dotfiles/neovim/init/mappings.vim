" Cycle through buffers
nmap <silent>[b :bp<CR>
nmap <silent>]b :bn<CR>

" Create new line without entering insert mode
nmap <Leader>o o<Esc>
nmap <Leader>O O<Esc>

" Exit terminal mode with <Esc>
tnoremap <Esc> <C-\><C-n>

" Move between tabs with Alt and Left/Right keys
noremap <A-Right> gt
noremap <A-Left> gT

nnoremap <Leader>ff <Cmd>Telescope find_files<CR>
nnoremap <Leader>fg <Cmd>Telescope live_grep<CR>
nnoremap <Leader>fb <Cmd>Telescope buffers<CR>
nnoremap <Leader>fh <Cmd>Telescope help_tags<CR>

nmap <silent> <F2> <Cmd>TagbarToggle<CR>

nnoremap <silent> ge <Cmd>Explore<CR>

nnoremap <silent> <C-n> <Cmd>NvimTreeToggle<CR>
nnoremap <silent> <Leader>r <Cmd>NvimTreeRefresh<CR>

imap <expr> <Tab> snippy#can_expand_or_advance() ?
    \ '<Plug>(snippy-expand-or-advance)' : '<Tab>'
imap <expr> <S-Tab> snippy#can_jump(-1) ? '<Plug>(snippy-previous)' : '<S-Tab>'
smap <expr> <Tab> snippy#can_jump(1) ? '<Plug>(snippy-next)' : '<Tab>'
smap <expr> <S-Tab> snippy#can_jump(-1) ? '<Plug>(snippy-previous)' : '<S-Tab>'
xmap <Tab> <Plug>(snippy-cut-text)


if !(exists("s:zen_mode") && exists("s:zen_absolute"))
    let s:zen_mode = 0
    let s:zen_absolute = 0
endif

" Absolute distraction free Zen Mode
function! s:VolatileZen(absolute)
    execute "ZenMode"

    if !s:zen_mode
        if a:absolute
            let s:opt_nu = &number
            let s:opt_rnu = &relativenumber
            let s:opt_cc = &colorcolumn
            let s:opt_list = &list
            let s:opt_cul = &cursorline

            set nonumber norelativenumber colorcolumn=0 nolist nocursorline

            let s:zen_absolute = 1
        endif

        let s:zen_mode = 1
    else
        if s:zen_absolute
            let &number = s:opt_nu
            let &relativenumber = s:opt_rnu
            let &colorcolumn = s:opt_cc
            let &list = s:opt_list
            let &cursorline = s:opt_cul

            unlet s:opt_nu s:opt_rnu s:opt_cc s:opt_list s:opt_cul

            let s:zen_absolute = 0
        endif

        let s:zen_mode = 0
    endif
endfunction

nmap <silent> <Leader>z :call <SID>VolatileZen(0)<CR>| " Normal Zen
nmap <silent> <Leader>Z :call <SID>VolatileZen(1)<CR>| " Absolute Zen

autocmd FileType vimwiki noremap <silent><buffer> glt
    \ :VimwikiToggleListItem<CR>

" To interrupt <C-z> sleep, remap <C-z> to undo (same as `u`)
map <C-z> <Undo>
