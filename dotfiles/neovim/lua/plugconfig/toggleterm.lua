require("toggleterm").setup {
    size = function(term)
        if term.direction == "horizontal" then
            return vim.o.lines * 0.4
        elseif term.direction == "vertical" then
            return vim.o.columns * 0.5
        end
    end,
    on_open = function()
        vim.api.nvim_buf_set_keymap(
            0, "n", "q", "<Cmd>close<CR>",
            { silent = true }
        )
    end,
    shell = "pwsh -NoLogo -WorkingDirectory .",
    direction = "float",
    float_opts = {
        border = "rounded",
    },
}
