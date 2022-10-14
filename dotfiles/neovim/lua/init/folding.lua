local INDICATOR_STR = "•"
local ANCHOR_STR = "❯❯"

function VolatileFolding()
    local fold_level_indicator = string.gsub(
        vim.v.folddashes,
        "-", INDICATOR_STR
    )
    local fold_size = vim.v.foldend - vim.v.foldstart + 1
    local first_line = string.gsub(
        vim.fn.getline(vim.v.foldstart),
        "^%s*(.-)%s*$", "%1"
    )

    return string.format(
        "  %s (+%s) %s %s",
        fold_level_indicator,
        fold_size,
        first_line,
        ANCHOR_STR
    )
end

vim.o.foldtext = "v:lua.VolatileFolding()"
vim.o.foldmethod = "indent"
vim.o.foldlevel = 1
