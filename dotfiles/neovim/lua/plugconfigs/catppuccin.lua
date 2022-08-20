vim.g.catppuccin_flavour = "mocha"

require("catppuccin").setup {
    -- Deactivate italic styles
    styles = {
        comments = {nil},
        conditionals = {nil},
    },
    integrations = {
        native_lsp = {
            virtual_text = {
                errors = {nil},
                hints = {nil},
                warnings = {nil},
                information = {nil},
            },
            underlines = {
                errors = {nil},
                hints = {nil},
                warnings = {nil},
                information = {nil},
            },
        },
    },
    custom_highlights = {
        TSParameter = {style = {nil}}
    },
}

vim.cmd [[colorscheme catppuccin]]

