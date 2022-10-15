local INDICATOR_STR = "•"
local ANCHOR_STR = "❯❯"

local function get_matching(opening)
    if opening == "(" then return ")"
    elseif opening == "[" then return "]"
    elseif opening == "{" then return "}"
    elseif opening == "<" then return ">"
    else return "" end
end

function NoMatchFolding()
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
        " %s (+%s) %s %s",
        fold_level_indicator,
        fold_size,
        first_line,
        ANCHOR_STR
    )
end

function BetterFoldtext()
    local root_line = string.gsub(
        vim.fn.getline(vim.v.foldstart),
        "\t", string.rep(" ", vim.o.tabstop)
    )

    local last_line = string.gsub(
        vim.fn.getline(vim.v.foldend),
        "^%s*(.-)%s*$", "%1"
    )

    if (
        string.sub(last_line, 1,1) == get_matching(
            string.sub(root_line, #root_line)
        )
    ) then
        return root_line .. " ... " .. last_line
    else
        return NoMatchFolding()
    end
end

vim.o.foldmethod = "expr"
vim.o.foldexpr = "nvim_treesitter#foldexpr()"
vim.o.foldtext = "v:lua.BetterFoldtext()"
vim.o.foldmethod = "indent"
vim.o.foldlevel = 1
vim.o.foldnestmax = 3
