local packer_bootstrap = false
do  -- Automatically install packer.nvim if absent
    local fn = vim.fn
    local install_path = (
        fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
    )

    if fn.empty(fn.glob(install_path)) > 0 then
        packer_bootstrap = true

        fn.system({
            'git', 'clone', '--depth', '1',
            'https://github.com/wbthomason/packer.nvim',
            install_path
        })

        vim.cmd [[packadd packer.nvim]]
    end
end


local function get_config(name)
    return string.format('require("plugconfigs.%s")', name)
end


return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- Themes
    use 'morhetz/gruvbox'
    use 'navarasu/onedark.nvim'
    use {
        'catppuccin/nvim',
        as = 'catppuccin',
        config = get_config("catppuccin"),
    }

    use 'Konfekt/FastFold'
    use 'andweeb/presence.nvim'
    use 'dcampos/nvim-snippy'
    use 'ggandor/lightspeed.nvim'
    use 'klen/nvim-config-local'
    use 'kyazdani42/nvim-web-devicons'
    use 'lukas-reineke/indent-blankline.nvim'
    use 'nvim-lua/plenary.nvim'
    use 'p00f/nvim-ts-rainbow'
    use 'preservim/tagbar'
    use 'takac/vim-hardtime'
    use 'tpope/vim-fugitive'
    use 'tpope/vim-repeat'
    use 'tpope/vim-surround'
    use 'vim-airline/vim-airline'
    use 'vim-airline/vim-airline-themes'
    use 'vimwiki/vimwiki'
    use {
        'williamboman/mason.nvim',
        config = function() require("mason").setup() end,
    }
    use {
        'williamboman/mason-lspconfig.nvim',
        after = {'nvim-lspconfig', 'coq_nvim'},
        requires = {
            'williamboman/mason.nvim',
            'neovim/nvim-lspconfig'
        },
        config = get_config("lspconfig"),
    }
    use {
        'neovim/nvim-lspconfig',
    }
    use {
        'b3nj5m1n/kommentary',
        config = function()
            require('kommentary.config').use_extended_mappings()
        end,
    }
    use {
        'benstockil/twilight.nvim',
        config = function() require("twilight").setup {} end,
    }
    use {
        'norcalli/nvim-colorizer.lua',
        config = function() require("colorizer").setup {} end,
    }
    use {
        'folke/todo-comments.nvim',
        config = function() require("todo-comments").setup {} end,
    }
    use {
        'folke/which-key.nvim',
        config = function() require("which-key").setup {} end,
    }
    use {
        'folke/zen-mode.nvim',
        config = function()
            require("zen-mode").setup { window = { width = 96 } }
        end,
    }
    use {
        'kyazdani42/nvim-tree.lua',
        config = function()
            require("nvim-tree").setup {
                renderer = { indent_markers = { enable = true } }
            }
        end,
    }
    use {
        'nanozuki/tabby.nvim',
        config = get_config("tabby"),
    }
    use {
        'nvim-treesitter/nvim-treesitter',
        config = get_config("nvim-treesitter"),
    }
    use {
        "akinsho/toggleterm.nvim",
        tag = 'v2.*',
        config = get_config("toggleterm"),
        keys = [[<C-\>]],
    }
    use {
        'junegunn/fzf',
        run = function() vim.fn['fzf#install']() end
    }
    use {
        'junegunn/fzf.vim',
        requires = {'junegunn/fzf'},
    }
    use {
        'ms-jpq/coq_nvim',
        branch = 'coq',
        config = function() require("coq") end
    }
    use {
        'ms-jpq/coq.artifacts',
        branch = 'artifacts',
        requires = {'ms-jpq/coq_nvim'},
    }

  -- Automatically set up the configuration after cloning packer.nvim
    if packer_bootstrap then
        require('packer').sync()
    end
end)
