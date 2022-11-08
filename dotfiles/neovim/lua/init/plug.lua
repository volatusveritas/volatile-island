-- Bootstrap
local packer_bootstrap = false

do -- Automatically install packer.nvim if absent
    local install_path = (
        vim.fn.stdpath('data')
        .. '/site/pack/packer/start/packer.nvim'
    )

    if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
        packer_bootstrap = true
        vim.fn.system({
            'git', 'clone', '--depth', '1',
            'https://github.com/wbthomason/packer.nvim',
            install_path
        })
        vim.cmd("packadd packer.nvim")
    end
end


local function plugin(name)
    return require(string.format("plugin.%s", name))
end


return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- Themes
    use ( plugin "catppuccin" )
    use ( plugin "gruvbox" )
    use ( plugin "nord" )
    use ( plugin "onedark" )
    use ( plugin "onehalf" )

    use ( plugin "JABS" )
    use ( plugin "bookmarks" )
    use ( plugin "colorizer" )
    use ( plugin "coq" )
    use ( plugin "coq-artifacts" )
    use ( plugin "coq-thirdparty" )
    use ( plugin "feline" )
    use ( plugin "indent-blankline" )
    use ( plugin "kommentary" )
    use ( plugin "lightspeed" )
    use ( plugin "mason" )
    use ( plugin "mason-lspconfig" )
    use ( plugin "neorg" )
    use ( plugin "nvim-lspconfig" )
    use ( plugin "nvim-notify" )
    use ( plugin "nvim-tree" )
    use ( plugin "nvim-treesitter" )
    use ( plugin "nvim-ts-rainbow" )
    use ( plugin "nvim-web-devicons" )
    use ( plugin "overseer" )
    use ( plugin "persistence" )
    use ( plugin "presence" )
    use ( plugin "tagbar" )
    use ( plugin "telescope" )
    use ( plugin "telescope-emoji" )
    use ( plugin "todo-comments" )
    use ( plugin "toggleterm" )
    use ( plugin "twilight" )
    use ( plugin "vim-godot" )
    use ( plugin "volatile-org" )
    use ( plugin "which-key" )
    use ( plugin "workspaces" )
    use ( plugin "zen-mode" )
    use ( plugin 'plenary-nvim' )
    use ( plugin 'vim-fugitive' )
    use ( plugin 'vim-repeat' )
    use ( plugin 'vim-surround' )

    -- Automatically set up the configuration after cloning packer.nvim
    if packer_bootstrap then
        -- Things to do:
        --- [x] Sync Packer (+compile and all the other stuff)
        --- [x] Update/install all Treesitter parsers
        --- [x] Update/install all LSP servers
        --- [ ] nvim_echo() to warn about the boostrap
        require('packer').sync()
        vim.cmd("TSInstall all")
        vim.cmd("Mason")
    end
end)

-- vim:foldlevel=2:
