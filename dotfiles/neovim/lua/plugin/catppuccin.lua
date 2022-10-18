return {
    'catppuccin/nvim', as = 'catppuccin',
    config = function()
        vim.g.catppuccin_flavour = "mocha"

        require("catppuccin").setup {
            -- Deactivate italic styles
            styles = {
                comments = {},
                conditionals = {},
            },
            integrations = {
                native_lsp = {
                    virtual_text = {
                        errors = {},
                        hints = {},
                        warnings = {},
                        information = {},
                    },
                    underlines = {
                        errors = {},
                        hints = {},
                        warnings = {},
                        information = {},
                    },
                },
            },
            custom_highlights = {
                TSParameter = { style = {} }
            },
        }
    end,
}
