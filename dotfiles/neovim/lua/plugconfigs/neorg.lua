require("neorg").setup {
    load = {
        ["core.defaults"] = {},
        ["core.keybinds"] = {
            config = {
                default_keybinds = true,
            },
        },
        ["core.norg.concealer"] = {
            config = {
                -- Deactivate automatic foldmethod=expr
                folds = false,
            },
        },
        ["core.gtd.base"] = {
            config = {
                workspace = "gtd",
                default_lists = {
                    inbox = "index.norg"
                },
            }
        },
        ["core.presenter"] = {
            config = {
                zen_mode = "zen-mode",
            }
        },
        ["core.norg.dirman"] = {
            config = {
                workspaces = {
                    home = "~/neorg/workspaces/home",
                    gtd = "~/neorg/workspaces/gtd"
                },
                autochdir = false,
                default_workspace = "home",
            }
        }
    }
}

vim.keymap.set("n", "<Leader>tv", "<Cmd>Neorg gtd views<CR>")
vim.keymap.set("n", "<Leader>tc", "<Cmd>Neorg gtd capture<CR>")
