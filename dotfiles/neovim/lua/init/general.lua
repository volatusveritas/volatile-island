-- Value options
vim.g.mapleader = ","
vim.o.tabstop = 4
vim.o.textwidth = 79
vim.o.scrolloff = 10
vim.o.shiftwidth = 4
vim.o.colorcolumn = "80"
vim.o.formatoptions = vim.o.formatoptions .. "t"
vim.o.clipboard = "unnamedplus"
vim.o.showbreak = "↪ "

vim.o.fillchars = table.concat({
    "fold: ",
}, ",")

vim.o.listchars = table.concat({
    "tab:→ ",
    "nbsp:␣",
    "trail:•",
    "extends:⟩",
    "precedes:⟨",
}, ",")

vim.o.path = table.concat({
    ",", -- Current directory
    ".", -- Directory of the current file
    "include",    -- For C/C++ (cwd)
    "./include",  -- For C/C++ (file directory)
    "lua",   -- Because Neovim (cwd)
    "./lua", -- Because Neovim (file directory)
}, ",")


-- Set/unset options
vim.o.list = true
vim.o.wrap = false
vim.o.number = true
vim.o.smartcase = true
vim.o.expandtab = true
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.cursorline = true
vim.o.ignorecase = true
vim.termguicolors = true
vim.o.termguicolors = true
vim.o.relativenumber = true


-- Miscellaneous options
vim.cmd("filetype plugin on")
