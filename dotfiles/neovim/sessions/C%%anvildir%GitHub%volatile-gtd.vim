let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd C:/anvildir/GitHub/volatile-gtd
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
let s:shortmess_save = &shortmess
if &shortmess =~ 'A'
  set shortmess=aoOA
else
  set shortmess=aoO
endif
badd +11 ./oopdpg/handler.py
badd +51 ./oopdpg/window.py
badd +3 vgtd/__main__.py
badd +5 oopdpg/types.py
badd +5 vgtd/input.py
badd +1 oopdpg/__init__.py
badd +14 C:/anvildir/GitHub/volatile-gtd/vgtd/windows/lists.py
argglobal
%argdel
$argadd ./oopdpg/handler.py
$argadd ./oopdpg/window.py
edit vgtd/__main__.py
let s:save_splitbelow = &splitbelow
let s:save_splitright = &splitright
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd _ | wincmd |
split
1wincmd k
wincmd w
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
exe '1resize ' . ((&lines * 24 + 25) / 50)
exe 'vert 1resize ' . ((&columns * 97 + 97) / 194)
exe '2resize ' . ((&lines * 23 + 25) / 50)
exe 'vert 2resize ' . ((&columns * 97 + 97) / 194)
exe 'vert 3resize ' . ((&columns * 96 + 97) / 194)
argglobal
if bufexists(fnamemodify("vgtd/__main__.py", ":p")) | buffer vgtd/__main__.py | else | edit vgtd/__main__.py | endif
if &buftype ==# 'terminal'
  silent file vgtd/__main__.py
endif
balt ./oopdpg/handler.py
let s:l = 3 - ((2 * winheight(0) + 12) / 24)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 3
normal! 0
wincmd w
argglobal
if bufexists(fnamemodify("C:/anvildir/GitHub/volatile-gtd/vgtd/windows/lists.py", ":p")) | buffer C:/anvildir/GitHub/volatile-gtd/vgtd/windows/lists.py | else | edit C:/anvildir/GitHub/volatile-gtd/vgtd/windows/lists.py | endif
if &buftype ==# 'terminal'
  silent file C:/anvildir/GitHub/volatile-gtd/vgtd/windows/lists.py
endif
balt ./oopdpg/handler.py
let s:l = 14 - ((10 * winheight(0) + 11) / 23)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 14
let s:c = 78 - ((76 * winwidth(0) + 48) / 97)
if s:c > 0
  exe 'normal! ' . s:c . '|zs' . 78 . '|'
else
  normal! $
endif
wincmd w
argglobal
2argu
balt oopdpg/__init__.py
let s:l = 81 - ((46 * winheight(0) + 24) / 48)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 81
normal! 0
wincmd w
2wincmd w
exe '1resize ' . ((&lines * 24 + 25) / 50)
exe 'vert 1resize ' . ((&columns * 97 + 97) / 194)
exe '2resize ' . ((&lines * 23 + 25) / 50)
exe 'vert 2resize ' . ((&columns * 97 + 97) / 194)
exe 'vert 3resize ' . ((&columns * 96 + 97) / 194)
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
