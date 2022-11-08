local opts_silent = { silent = true }

-- Cycle through buffers
vim.keymap.set("n", "[b", "<Cmd>bprevious<CR>", opts_silent)
vim.keymap.set("n", "]b", "<Cmd>bnext<CR>", opts_silent)

-- Create new line without entering insert mode
vim.keymap.set("n", "<Leader>o", "o<Esc>")
vim.keymap.set("n", "<Leader>O", "O<Esc>")

-- Exit terminal mode with <Esc>
vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]])

-- Move between tabs with Alt and Left/Right keys
vim.keymap.set("n", "<A-Right>", "<Cmd>tabnext<CR>", {})
vim.keymap.set("n", "<A-Left>", "<Cmd>tabprevious<CR>", {})

-- To interrupt <C-z> sleep, remap <C-z> to undo
vim.keymap.set("n", "<C-z>", "<Undo>")


-- Keygroup Prefixes
local prefixes = {
    overseer = "<Leader>t",
    telescope = "<Leader>f",
    fugitive = "dg",
    toggleterm = "<C-t>",
    workspaces = "<Leader>w",
    persistence = "<Leader>s",
    editor_tools = "<Leader>n",
}


-- Editor Tools (Volavim)
vim.keymap.set(
    "n", prefixes.editor_tools .. "c",
    require("init.volavim").editor_config
)
vim.keymap.set(
    "n", prefixes.editor_tools .. "pc",
    require("init.volavim").editor_plugin_config
)
vim.keymap.set(
    "n", prefixes.editor_tools .. "pp",
    require("init.volavim").editor_plugin_plugconfig
)
vim.keymap.set(
    "n", prefixes.editor_tools .. "pn",
    require("init.volavim").editor_plugin_new
)


-- Persistence
vim.keymap.set( -- "current dir"
    "n", prefixes.persistence .. "c",
    [[<Cmd>lua require("persistence")config.load()<CR>]]
)
vim.keymap.set( -- "last session"
    "n", prefixes.persistence .. "l",
    [[<Cmd>lua require("persistence").load({ last = true })<CR>]]
)
vim.keymap.set( -- "delete persistence"
    "n", prefixes.persistence .. "d",
    [[<Cmd>lua require("persistence").stop()<CR>]]
)


-- Workspaces.nvim
vim.keymap.set("n", prefixes.workspaces .. "a", ":WorkspacesAdd<Space>")
vim.keymap.set("n", prefixes.workspaces .. "r", ":WorkspacesRename<Space>")
vim.keymap.set("n", prefixes.workspaces .. "R", ":WorkspacesRemove<Space>")
vim.keymap.set("n", prefixes.workspaces .. "l", "<Cmd>WorkspacesList<CR>")


-- JABS.nvim
vim.keymap.set("n", "go", "<Cmd>JABSOpen<CR>")


-- Overseer (Tasks)
vim.keymap.set("n", prefixes.overseer .. "r", "<Cmd>OverseerRun<CR>")
vim.keymap.set("n", prefixes.overseer .. "t", "<Cmd>OverseerToggle<CR>")
vim.keymap.set("n", prefixes.overseer .. "e", function()
    vim.cmd("edit " .. string.format(
        "%s/lua/overseer/template/%s.lua",
        vim.fn.stdpath("config"),
        vim.fn.input("[Edir Overseer Template] Target File: ")
    ))
end)


-- Telescope
vim.keymap.set("n", prefixes.telescope .. prefixes.telescope, "<Cmd>Telescope<CR>")
vim.keymap.set("n", prefixes.telescope .. "f", "<Cmd>Telescope find_files<CR>")
vim.keymap.set("n", prefixes.telescope .. "g", "<Cmd>Telescope live_grep<CR>")
vim.keymap.set("n", prefixes.telescope .. "b", "<Cmd>Telescope buffers<CR>")
vim.keymap.set("n", prefixes.telescope .. "h", "<Cmd>Telescope help_tags<CR>")

--- Extensions
vim.keymap.set("n", prefixes.telescope .. "e", "<Cmd>Telescope emoji<CR>")
vim.keymap.set("n", prefixes.telescope .. "w", "<Cmd>Telescope workspaces<CR>")


-- Tagbar
vim.keymap.set("n", "<F2>", "<Cmd>TagbarToggle<CR>", opts_silent)


-- Nvim-tree
vim.keymap.set("n", "<C-n>", "<Cmd>NvimTreeFocus<CR>")
vim.keymap.set("n", "ge", function()
    require("nvim-tree").open_replacing_current_buffer()
end)


-- Fugitive
vim.keymap.set("n", prefixes.fugitive .. "g", ":G<Space>", {})
vim.keymap.set("n", prefixes.fugitive .. "c", ":G commit<Space>", {})
vim.keymap.set("n", prefixes.fugitive .. "C", "<Cmd>G commit<CR>", {})
vim.keymap.set("n", prefixes.fugitive .. "a", ":G add<Space>", {})
vim.keymap.set("n", prefixes.fugitive .. "A", "<Cmd>G add .<CR>", {})
vim.keymap.set("n", prefixes.fugitive .. "b", ":G branch<Space>", {})
vim.keymap.set("n", prefixes.fugitive .. "B", "<Cmd>G branch<CR>", {})
vim.keymap.set("n", prefixes.fugitive .. "d", ":G diff<Space>", {})
vim.keymap.set("n", prefixes.fugitive .. "D", "<Cmd>G diff<CR>", {})
vim.keymap.set("n", prefixes.fugitive .. "p", ":G push<Space>", {})
vim.keymap.set("n", prefixes.fugitive .. "P", "<Cmd>G push<CR>", {})
vim.keymap.set("n", prefixes.fugitive .. "m", ":G merge<Space>", {})
vim.keymap.set("n", prefixes.fugitive .. "S", "<Cmd>G status<CR>", {})


-- Toggleterm
vim.keymap.set("n", prefixes.toggleterm .. "f", "<Cmd>ToggleTerm direction=float<CR>", opts_silent)
vim.keymap.set("n", prefixes.toggleterm .. "x", "<Cmd>ToggleTerm direction=horizontal<CR>", opts_silent)
vim.keymap.set("n", prefixes.toggleterm .. "v", "<Cmd>ToggleTerm direction=vertical<CR>", opts_silent)
vim.keymap.set("n", prefixes.toggleterm .. "t", "<Cmd>ToggleTerm direction=tab<CR>", opts_silent)


-- (Zen Mode)
local zen_mode = false
local zen_absolute = false
local zen_opts = {
    number = false,
    relativenumber = false,
    colorcolumn = false,
    list = false,
    cursorline = false,
}

local function volatile_zen(absolute)
    vim.fn.execute("ZenMode")

    if zen_mode == false then
        zen_mode = true

        if absolute == true then
            zen_opts.number = vim.o.number
            zen_opts.relativenumber = vim.o.relativenumber
            zen_opts.colorcolumn = vim.o.colorcolumn
            zen_opts.list = vim.o.list
            zen_opts.cursorline = vim.o.cursorline

            vim.o.number = false
            vim.o.relativenumber = false
            vim.colorcolumn = 0
            vim.o.list = false
            vim.o.cursorline = false

            zen_absolute = true
        end
    else
        zen_mode = false

        if zen_absolute then
            vim.o.number = zen_opts.number
            vim.o.relativenumber = zen_opts.relativenumber
            vim.o.colorcolumn = zen_opts.colorcolumn
            vim.o.list = zen_opts.list
            vim.o.cursorline = zen_opts.cursorline

            zen_absolute = false
        end
    end
end

vim.keymap.set("n", "<Leader>z", function() volatile_zen(false) end, opts_silent) -- Normal Zen
vim.keymap.set("n", "<Leader>Z", function() volatile_zen(true) end, opts_silent) -- Absolute Zen
