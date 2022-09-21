if exists("did_load_filetypes")
    finish
endif

augroup filetypedetect
    au!
    au BufRead,BufNewFile *.vorg setfiletype vorg
    au BufRead,BufNewFile *.outdefs setfiletype outdefs
augroup END
