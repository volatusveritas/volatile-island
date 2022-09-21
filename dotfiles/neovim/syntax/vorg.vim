if exists("b:current_syntax")
    finish
endif


syntax case ignore

" syntax match vorgHeaderLeveler /\*\*\@=/ contained transparent conceal cchar= 

" Possible chars: ◉ ⦿ ○ ✿ ◆ ✸ <- change the last one
syntax match vorgHeader1Marker /\(^\s*\)\@<=\*\(\s\+\)\@=/ contained transparent
syntax match vorgHeader2Marker /\(^\s*\*\)\@<=\*\(\s\+\)\@=/ contained transparent
syntax match vorgHeader3Marker /\(^\s*\*\*\)\@<=\*\(\s\+\)\@=/ contained transparent
syntax match vorgHeader4Marker /\(^\s*\*\*\*\)\@<=\*\(\s\+\)\@=/ contained transparent
syntax match vorgHeader5Marker /\(^\s*\*\*\*\*\)\@<=\*\(\s\+\)\@=/ contained transparent
syntax match vorgHeader6Marker /\(^\s*\*\*\*\*\*\)\@<=\*\(\s\+\)\@=/ contained transparent

syntax match vorgHeader1Full /\(^\s*\)\@<=\*\(\s\+\).*$/ contains=vorgHeaderLeveler,vorgHeader1Marker
syntax match vorgHeader2Full /\(^\s*\)\@<=\*\*\(\s\+\).*$/ contains=vorgHeaderLeveler,vorgHeader2Marker
syntax match vorgHeader3Full /\(^\s*\)\@<=\*\*\*\(\s\+\).*$/ contains=vorgHeaderLeveler,vorgHeader3Marker
syntax match vorgHeader4Full /\(^\s*\)\@<=\*\*\*\*\(\s\+\).*$/ contains=vorgHeaderLeveler,vorgHeader4Marker
syntax match vorgHeader5Full /\(^\s*\)\@<=\*\*\*\*\*\(\s\+\).*$/ contains=vorgHeaderLeveler,vorgHeader5Marker
syntax match vorgHeader6Full /\(^\s*\)\@<=\*\*\*\*\*\*\(\s\+\).*$/ contains=vorgHeaderLeveler,vorgHeader6Marker


highlight link vorgHeader1Full Constant
highlight link vorgHeader2Full Keyword
highlight link vorgHeader3Full Type
highlight link vorgHeader4Full Special
highlight link vorgHeader5Full PreProc
highlight link vorgHeader6Full Identifier


function! VorgFold(lnum)
    let l:line = getline(a:lnum)
    let l:next_asterisk = match(line, '\(^\s*\)\@<=\*')
    let l:level = 0

    if l:next_asterisk != -1
        while l:next_asterisk != -1
            let l:level += 1
            let l:next_asterisk = match(l:line, '\*', l:next_asterisk + 1)
        endwhile

        return l:level - 1
    endif

    if l:line == ""
        return -1
    endif

    let l:line = getline(a:lnum - 1)
    let l:next_asterisk = match(line, '\(^\s*\)\@<=\*')

    while l:next_asterisk != -1
        let l:level += 1
        let l:next_asterisk = match(l:line, '\*', l:next_asterisk + 1)
    endwhile

    if l:level > 0
        return l:level
    else
        return "="
    endif
endfunction

function! VorgIndent(lnum)
    return 2 + VorgFold(a:lnum - 1)
endfunction


setlocal conceallevel=1
setlocal concealcursor=nvc

setlocal foldmethod=expr
setlocal foldexpr=VorgFold(v:lnum)

setlocal nolisp
setlocal autoindent
setlocal indentexpr=VorgIndent(v:lnum)
setlocal indentkeys+=*
