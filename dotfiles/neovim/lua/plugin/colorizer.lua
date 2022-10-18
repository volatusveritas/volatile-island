return {
    'norcalli/nvim-colorizer.lua',
    config = function()
        vim.g.colorizer_auto_filetype = "css,html"

        require("colorizer").setup {}
    end,
}
