return {
    'xiyaowong/telescope-emoji.nvim',
    requires = 'nvim-telescope/telescope.nvim',
    config = function()
        require("telescope").load_extension("emoji")
    end,
}
