return {
    'rcarriga/nvim-notify',
    config = function()
        vim.notify = require("notify").setup {
            stages = "slide",
        }
    end,
}
