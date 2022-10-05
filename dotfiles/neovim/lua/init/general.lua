-- Value settings
vim.g.mapleader = ","
vim.o.path = ".,include,"
vim.o.tabstop = 4
vim.o.textwidth = 79
vim.o.scrolloff = 10
vim.o.shiftwidth = 4
vim.o.colorcolumn = "80"
vim.o.formatoptions = vim.o.formatoptions .. "t"
vim.o.foldmethod = "indent"
vim.o.clipboard = "unnamedplus"
vim.o.showbreak="↪ "
vim.o.listchars="tab:→ ,nbsp:␣,trail:•,extends:⟩,precedes:⟨"
vim.o.foldcolumn="auto"

-- Set/unset settings
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

vim.cmd("filetype plugin on")
