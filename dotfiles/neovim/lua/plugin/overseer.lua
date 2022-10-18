return {
    'stevearc/overseer.nvim',
    requires = 'stevearc/dressing.nvim',
    config = function()
        require("plugconfig.overseer")
    end,
}
