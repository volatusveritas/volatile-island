return {
    'lukas-reineke/indent-blankline.nvim',
    config = function()
        vim.g.indent_blankline_use_treesitter = 1
        vim.g.indent_blankline_show_current_context = 1
    end,
}
