local feline = require("feline")
local vi_mode = require("feline.providers.vi_mode")
local cursor = require("feline.providers.cursor")


-------------------------------
--    Auxiliary functions    --
-------------------------------

local function get_color_code(name)
    return "#" .. vim.fn.printf("%X", tostring(
        vim.api.nvim_get_hl_by_name(name, true).foreground
    ))
end

local function get_feline_volatile_color(name)
    return get_color_code("FelineVolatile" .. name)
end


--------------------------------
--    Components and setup    --
--------------------------------

local LEFT = 1
local MIDDLE = 2
local RIGHT = 3


local prov_empty = {
    hl = {
        fg = "bg",
    }
}

local prov_vi_mode = {
    provider = "vi_mode",
    opts = {
        show_mode_name = true,
    },
    icon = "",
    hl = function()
        return {
            name = vi_mode.get_mode_highlight_name(),
            fg = "bg",
            bg = vi_mode.get_mode_color(),
            style = "bold",
        }
    end,
    right_sep = "block",
    left_sep = "block",
}

local prov_current_file = {
    provider = function()
        if vim.fn.expand("%:p") == "" then
            return "[New]"
        end

        local custom_path = (
            vim.fn.expand("%:p:h:t") .. "/" .. vim.fn.expand("%:p:t")
        )

        local icon = require("nvim-web-devicons").get_icon(
            vim.fn.expand("%:p:t"),
            vim.fn.expand("%:e")
        )

        if icon then
            icon = icon .. " "
        end

        return custom_path, icon
    end,
    hl = function()
        local _, color = require("nvim-web-devicons").get_icon_color(
            vim.fn.expand("%:p:t"),
            vim.fn.expand("%:e")
        )

        return {
            fg = color,
        }
    end,
}

local prov_file_type = {
    provider = function()
        if vim.fn.expand("%:t") == "" and vim.o.filetype == "" then
            return "(No type)"
        end

        return (
            "("
            .. string.upper(string.sub(vim.o.filetype, 1,1))
            .. string.lower(string.sub(vim.o.filetype, 2))
            .. ")"
        )
    end,
    left_sep = " ",
}

local prov_file_status = {
    -- Updated Symbol: 
    provider = function()
        if vim.o.modified then
            return "●"
        else
            return ""
        end
    end,
    hl = {
        fg = "green",
    },
    left_sep = " ",
}

local prov_position = {
    --[[ provider = function()
        local cursor_pos = vim.api.nvim_win_get_cursor(0)
        return string.format("Ln %d, Col %d", cursor_pos[1], cursor_pos[2] + 1)
    end, ]]
    provider = "position",
}

local prov_line_percentage = {
    provider = function()
        return "(" .. cursor.line_percentage() .. ")"
    end,
    left_sep = " ",
    right_sep = " ",
}


local components = {
    active = {
        [LEFT] = {
            prov_vi_mode,
            prov_file_status,
        },
        [MIDDLE] = {
            prov_current_file,
            prov_file_type,
        },
        [RIGHT] = {
            prov_position,
            prov_line_percentage,
        },
    },
    inactive = {
        [LEFT] = {
            prov_file_status,
        },
        [MIDDLE] = {
            prov_current_file,
        },
        [RIGHT] = {
            prov_empty,
        },
    }
}


feline.setup {
    components = components,
    force_inactive = {
        filetypes = {
            '^NvimTree$',
            '^packer$',
            '^fugitive$',
            '^fugitiveblame$',
            '^qf$',
        },
        buftypes = {
            '^terminal$',
        },
    },
}


------------------------------------------------------------------------
--    Load colors from current colorscheme upon colorscheme change    --
------------------------------------------------------------------------

local feline_volacolors_aug = vim.api.nvim_create_augroup(
    "FelineVolatileColors",
    { clear = true }
)

local function setup_feline_volatile_autocolors()
    vim.cmd [[highlight FelineVolatileForeground guifg=foreground]]
    vim.cmd [[highlight FelineVolatileBackground guifg=background]]
    vim.cmd [[highlight FelineVolatileBlack guifg=Black]]
    vim.cmd [[highlight FelineVolatileSkyBlue guifg=LightBlue]]
    vim.cmd [[highlight FelineVolatileCyan guifg=LightCyan]]
    vim.cmd [[highlight FelineVolatileGreen guifg=LightGreen]]
    vim.cmd [[highlight FelineVolatileOceanBlue guifg=Blue]]
    vim.cmd [[highlight FelineVolatileMagenta guifg=LightMagenta]]
    vim.cmd [[highlight FelineVolatileOrange guifg=Orange]]
    vim.cmd [[highlight FelineVolatileRed guifg=LightRed]]
    vim.cmd [[highlight FelineVolatileViolet guifg=Violet]]
    vim.cmd [[highlight FelineVolatileWhite guifg=White]]
    vim.cmd [[highlight FelineVolatileYellow guifg=LightYellow]]

    local theme = {
        fg = get_feline_volatile_color("Foreground"),
        bg = get_color_code("VertSplit"),
        black = get_feline_volatile_color("Black"),
        skyblue = get_feline_volatile_color("SkyBlue"),
        cyan = get_feline_volatile_color("Cyan"),
        green = get_feline_volatile_color("Green"),
        oceanblue = get_feline_volatile_color("Oceanblue"),
        magenta = get_feline_volatile_color("Magenta"),
        orange = get_feline_volatile_color("Orange"),
        red = get_feline_volatile_color("Red"),
        violet = get_feline_volatile_color("Violet"),
        white = get_feline_volatile_color("White"),
        yellow = get_feline_volatile_color("Yellow"),
    }

    for k, v in pairs(theme) do
        if #v == 2 then -- #X -> #XXXXXX
            theme[k] = "#" .. string.rep(string.sub(v, 2,2), 6)
        elseif #v == 4 then -- #XYZ -> #XXYYZZ
            theme[k] = (
                "#"
                .. string.rep(string.sub(v, 2,2), 2)
                .. string.rep(string.sub(v, 3,3), 2)
                .. string.rep(string.sub(v, 4,4), 2)
            )
        end
    end

    feline.use_theme(theme)
end

vim.api.nvim_create_autocmd("ColorScheme", {
    group = feline_volacolors_aug,
    callback = setup_feline_volatile_autocolors
})

setup_feline_volatile_autocolors()
