let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd C:/anvildir/Practice/Programming/Python/Stacklord
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
let s:shortmess_save = &shortmess
if &shortmess =~ 'A'
  set shortmess=aoOA
else
  set shortmess=aoO
endif
badd +1 ./stacklord/interpreter.py
badd +0 ./tests/test_interpreter.py
badd +3 ~/AppData/Local/nvim/lua/plugin/nvim-notify.lua
argglobal
%argdel
$argadd ./stacklord/interpreter.py
$argadd ./tests/test_interpreter.py
edit ~/AppData/Local/nvim/lua/plugin/nvim-notify.lua
let s:save_splitbelow = &splitbelow
let s:save_splitright = &splitright
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd w
let &splitbelow = s:save_splitbelow
let &splitright = s:save_splitright
wincmd t
let s:save_winminheight = &winminheight
let s:save_winminwidth = &winminwidth
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
exe 'vert 1resize ' . ((&columns * 97 + 97) / 194)
exe 'vert 2resize ' . ((&columns * 96 + 97) / 194)
argglobal
if bufexists(fnamemodify("~/AppData/Local/nvim/lua/plugin/nvim-notify.lua", ":p")) | buffer ~/AppData/Local/nvim/lua/plugin/nvim-notify.lua | else | edit ~/AppData/Local/nvim/lua/plugin/nvim-notify.lua | endif
if &buftype ==# 'terminal'
  silent file ~/AppData/Local/nvim/lua/plugin/nvim-notify.lua
endif
balt ./stacklord/interpreter.py
let s:l = 3 - ((2 * winheight(0) + 24) / 48)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 3
normal! 0
wincmd w
argglobal
2argu
balt ./stacklord/interpreter.py
let s:l = 1 - ((0 * winheight(0) + 24) / 48)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 1
normal! 0
wincmd w
exe 'vert 1resize ' . ((&columns * 97 + 97) / 194)
exe 'vert 2resize ' . ((&columns * 96 + 97) / 194)
tabnext 1
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0 && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20
let &shortmess = s:shortmess_save
let &winminheight = s:save_winminheight
let &winminwidth = s:save_winminwidth
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &g:so = s:so_save | let &g:siso = s:siso_save
set hlsearch
nohlsearch
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
