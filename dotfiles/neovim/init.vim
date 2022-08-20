source $LOCALAPPDATA/nvim/init/plug.lua      " plugin loader
source $LOCALAPPDATA/nvim/init/plugins.lua   " plugin settings
source $LOCALAPPDATA/nvim/init/general.vim   " general settings
source $LOCALAPPDATA/nvim/init/mappings.vim  " mappings
source $LOCALAPPDATA/nvim/init/dogit.vim     " Git functionality


" Prompt to clean, update, install, and regenerate compiled loader file when
" `plug.lua` is written to (e.g. `:w`)
function s:UpdatePackerPlugs()
    let choice = confirm(
        \"plug.lua has been updated. Synchronize Packer?",
        \"&Yes\n&No", 1)

    if choice == 1
        echo "Syncing Packer"
        PackerSync
    endif
endfunction

augroup packer_user_config
    autocmd!
    autocmd BufWritePost plug.lua source <afile>
        \ | call <SID>UpdatePackerPlugs()
augroup end
