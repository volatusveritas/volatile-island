return {
    'kyazdani42/nvim-tree.lua',
    requires = 'nvim-tree/nvim-web-devicons',
    config = function()
        require("nvim-tree").setup {
            hijack_netrw = true,
            hijack_directories = {
                enable = true,
            },
            sync_root_with_cwd = true,
            renderer = { indent_markers = { enable = true } },
            view = {
                mappings = {
                    list = {
                        {
                            key = "<CR>",
                            action = "edit_in_place"
                        }
                    }
                }
            }
        }
    end
}
