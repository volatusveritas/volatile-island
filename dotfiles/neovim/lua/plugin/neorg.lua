return {
    "nvim-neorg/neorg",
    requires = "nvim-lua/plenary.nvim",
    config = function()
        require("plugconfig.neorg")
    end,
}
