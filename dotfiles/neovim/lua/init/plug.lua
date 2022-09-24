-- BOOTSTRAP
local packer_bootstrap = false

do -- Automatically install packer.nvim if absent
    local install_path = (
        vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
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


local function get_plugconfig_str(name)
    return string.format('require("plugconfigs.%s")', name)
end

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- Themes
    use {
        'navarasu/onedark.nvim',
        config = function()
            vim.g.onedark_config = {
                style = 'dark',
                code_style = { comments = 'none' },
            }
        end,
    }
    use {
        'morhetz/gruvbox',
        config = function()
            vim.g.gruvbox_contrast_dark = "soft"
        end,
    }
    use {
        'catppuccin/nvim',
        as = 'catppuccin',
        config = get_plugconfig_str("catppuccin"),
    }

    use {
        'andweeb/presence.nvim',
        config = function()
            vim.g.presence_main_image = "neovim"
        end,
    }
    use 'ggandor/lightspeed.nvim'
    use 'kyazdani42/nvim-web-devicons'
    use {
        'lukas-reineke/indent-blankline.nvim',
        config = function()
            vim.g.indent_blankline_use_treesitter = 1
            vim.g.indent_blankline_show_current_context = 1
        end,
    }
    use 'nanozuki/tabby.nvim'
    use 'nvim-lua/plenary.nvim'
    use 'p00f/nvim-ts-rainbow'
    use {
        'preservim/tagbar',
        config = function()
            vim.g.tagbar_autofocus = 1
        end,
    }
    use 'takac/vim-hardtime'
    use 'tpope/vim-fugitive'
    use 'tpope/vim-repeat'
    use 'tpope/vim-surround'
    use 'tpope/vim-vinegar'
    use 'xiyaowong/telescope-emoji.nvim'
    use {
        'feline-nvim/feline.nvim',
        config = get_plugconfig_str("feline")
    }
    use {
        "nvim-neorg/neorg",
        requires = "nvim-lua/plenary.nvim",
        config = get_plugconfig_str("neorg"),
    }
    use {
        'williamboman/mason.nvim',
        config = function() require("mason").setup() end,
    }
    use {
        'williamboman/mason-lspconfig.nvim',
        after = { 'nvim-lspconfig', 'coq_nvim' },
        requires = {
            'williamboman/mason.nvim',
            'neovim/nvim-lspconfig'
        },
        config = get_plugconfig_str("lspconfig"),
    }
    use 'neovim/nvim-lspconfig'
    use {
        'volatusveritas/bookmarks.nvim',
        config = function() require("bookmarks") end,
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
        config = function()
            vim.g.colorizer_auto_filetype = "css,html"

            require("colorizer").setup {}
        end,
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
        end
    }
    use {
        'kyazdani42/nvim-tree.lua',
        config = function()
            require("nvim-tree").setup {
                renderer = { indent_markers = { enable = true } }
            }
        end
    }
    use {
        'nvim-treesitter/nvim-treesitter',
        config = get_plugconfig_str("nvim-treesitter"),
    }
    use {
        "akinsho/toggleterm.nvim",
        tag = 'v2.*',
        config = get_plugconfig_str("toggleterm"),
    }
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        after = "telescope-emoji.nvim",
        requires = 'nvim-lua/plenary.nvim',
        config = function()
            require("telescope").load_extension("emoji")
        end,
    }
    use {
        'ms-jpq/coq_nvim',
        branch = 'coq',
        commit = '84ec5faf2aaf49819e626f64dd94f4e71cf575bc',
        config = function()
            vim.g.coq_settings = { auto_start = "shut-up" }

            require("coq")
        end
    }
    use {
        'ms-jpq/coq.artifacts',
        branch = 'artifacts',
        requires = 'coq_nvim',
    }

    -- Automatically set up the configuration after cloning packer.nvim
    if packer_bootstrap then
        require('packer').sync()
    end
end)
