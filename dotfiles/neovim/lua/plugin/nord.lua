return {
    'shaunsingh/nord.nvim',
    config = function()
        vim.g.nord_italic = false
        require("nord").set()
    end
}
