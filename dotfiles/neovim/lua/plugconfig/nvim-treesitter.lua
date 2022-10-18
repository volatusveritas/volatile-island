require("nvim-treesitter.install").compilers = { "clang" }
require("nvim-treesitter.configs").setup {
    ensure_installed = "all",
    ignore_install = {"phpdoc"},
    auto_install = true,
    highlight = { enable = true },
    rainbow = {
        enable = true, extended_mode = true, max_file_lines = nil,
        colors = {
            "#a5adcb", -- subtext0/gray
            "#ed8796", -- red
            "#a6da95", -- green
            "#eed49f", -- yellow
            "#8aadf4", -- blue
            "#f5bde6", -- pink
            "#91d7e3", -- sky/cyan
        }
    }
}
