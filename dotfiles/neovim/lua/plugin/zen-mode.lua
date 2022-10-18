return {
    'folke/zen-mode.nvim',
    requires = 'folke/twilight.nvim',
    config = function()
        require("zen-mode").setup { window = { width = 96 } }
    end
}
