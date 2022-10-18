return {
    'natecraddock/workspaces.nvim',
    requires = 'nvim-telescope/telescope.nvim',
    config = function()
        require("workspaces").setup()
        require("telescope").load_extension("workspaces")
    end,
}
