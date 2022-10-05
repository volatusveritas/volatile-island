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
vim.keymap.set("", "<C-z>", "<Undo>")


-- Overseer (Seer)
vim.keymap.set("n", "<Leader>sr", "<Cmd>OverseerRun<CR>")
vim.keymap.set("n", "<Leader>st", "<Cmd>OverseerToggle<CR>")


-- Telescope
vim.keymap.set("n", "<Leader>f<Leader>f", "<Cmd>Telescope<CR>")
vim.keymap.set("n", "<Leader>ff", "<Cmd>Telescope find_files<CR>")
vim.keymap.set("n", "<Leader>fg", "<Cmd>Telescope live_grep<CR>")
vim.keymap.set("n", "<Leader>fb", "<Cmd>Telescope buffers<CR>")
vim.keymap.set("n", "<Leader>fh", "<Cmd>Telescope help_tags<CR>")

vim.keymap.set("n", "<Leader>fe", "<Cmd>Telescope emoji<CR>")


-- Tagbar
vim.keymap.set("n", "<F2>", "<Cmd>TagbarToggle<CR>", opts_silent)


-- Vinegar
vim.keymap.set("n", "ge", "<Cmd>Explore<CR>", opts_silent)


-- NvimTree
vim.keymap.set("n", "<C-n>", "<Cmd>NvimTreeFocus<CR>", opts_silent)
vim.keymap.set("n", "<Leader>r", "<Cmd>NvimTreeRefresh<CR>", opts_silent)


-- Fugitive
vim.keymap.set("n", "dgg", ":G<Space>", {})
vim.keymap.set("n", "dgc", ":G commit<Space>", {})
vim.keymap.set("n", "dgC", "<Cmd>G commit<CR>", {})

vim.keymap.set("n", "dga", ":G add<Space>", {})
vim.keymap.set("n", "dgA", "<Cmd>G add .<CR>", {})

vim.keymap.set("n", "dgb", ":G branch<Space>", {})
vim.keymap.set("n", "dgB", "<Cmd>G branch<CR>", {})

vim.keymap.set("n", "dgd", ":G diff<Space>", {})
vim.keymap.set("n", "dgD", "<Cmd>G diff<CR>", {})

vim.keymap.set("n", "dgp", ":G push<Space>", {})
vim.keymap.set("n", "dgP", "<Cmd>G push<CR>", {})

vim.keymap.set("n", "dgm", ":G merge<Space>", {})

vim.keymap.set("n", "dgS", "<Cmd>G status<CR>", {})


-- Toggleterm
vim.keymap.set("n", "<C-t>f", "<Cmd>ToggleTerm direction=float<CR>", opts_silent)
vim.keymap.set("n", "<C-t>x", "<Cmd>ToggleTerm direction=horizontal<CR>", opts_silent)
vim.keymap.set("n", "<C-t>v", "<Cmd>ToggleTerm direction=vertical<CR>", opts_silent)
vim.keymap.set("n", "<C-t>t", "<Cmd>ToggleTerm direction=tab<CR>", opts_silent)


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
