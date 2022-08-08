require("mason").setup {}

require("todo-comments").setup {}

require("twilight").setup {}

require("transparent").setup { enable = false }

require("zen-mode").setup { window = { width = 96 } }

require("nvim-tree").setup {
    renderer = { indent_markers = { enable = true } }
}

require("mason-lspconfig").setup {
    ensure_installed = {
        "clangd",  -- C/C++
        "cmake",  -- cmake
        "cssls",  -- CSS
        "eslint",  -- ESLint (JS Linter)
        "html",  -- HTML
        "jsonls",  -- JSON
        "ltex",  -- LaTeX
        "marksman",  -- Markdown
        "powershell_es",  -- Powershell
        "pyright",  -- Python"
        "sumneko_lua",  -- Lua
        "tsserver",  -- JavaScript/TypeScript
        "vimls",  -- VimL
    },
    automatic_installation = true,
}

local on_attach = function(_, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    local bufopts = { noremap=true, silent=true, buffer=bufnr }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set(
        'n', '<leader>wa', vim.lsp.buf.add_workspace_folder, bufopts
    )
    vim.keymap.set(
        'n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, bufopts
    )
    vim.keymap.set('n', '<leader>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, bufopts)
    vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
    vim.keymap.set('n', '<leader>f', vim.lsp.buf.formatting, bufopts)
end

local coq = require("coq")

require("mason-lspconfig").setup_handlers {
    function (server_name)
        require("lspconfig")[server_name].setup(coq.lsp_ensure_capabilities {
            on_attach = on_attach
        })
    end,

    ["sumneko_lua"] = function()
        require("lspconfig").sumneko_lua.setup {
            settings = { Lua = { diagnostics = { globals = {
                "vim", "minetest"
            }}}}
        }
    end
}

require("nvim-treesitter.install").compilers = { "clang" }
require("nvim-treesitter.configs").setup {
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
            -- "#cad3f5", -- text/white
            -- "#f4dbd6", -- rosewater
            -- "#f0c6c6", -- flamingo
            -- "#c6a0f6", -- mauve
            -- "#ee99a0", -- maroon
            -- "#f5a97f", -- peach
            -- "#8bd5ca", -- teal
            -- "#7dc4e4", -- sapphire
            -- "#b7bdf8", -- lavender
        }
    }
}

require("catppuccin").setup {
    styles = {
        comments = { nil },
        conditionals = { nil },
    },
    custom_highlights = {
        TSParameter = { style = { nil } }
    },
    transparent_background = true,
    integrations = {
        nvimtree = { transparent_panel = true }
    },
}

require("toggleterm").setup {
    size = function(term)
        if term.direction == "horizontal" then
            return vim.o.lines * 0.4
        elseif term.direction == "vertical" then
            return vim.o.columns * 0.4
        end
    end,
    open_mapping = [[<C-\>]],
    shell = "pwsh --nologo",
    direction = "tab"
}

local tabline_config = require("tabby.presets").active_wins_at_tail
do
    local separator = require("tabby.text").separator
    local primary = separator("", "TabLineSel", "TabLineFill")
    local secondary = separator("", "TabLine", "TabLineFill")
    tabline_config.head = {}
    tabline_config.active_tab.left_sep = primary
    tabline_config.active_tab.right_sep = primary
    tabline_config.inactive_tab.left_sep = secondary
    tabline_config.inactive_tab.right_sep = secondary
    tabline_config.top_win.left_sep = secondary
    tabline_config.top_win.right_sep = secondary
    tabline_config.win.left_sep = secondary
    tabline_config.win.right_sep = secondary
    tabline_config.tail = {}
end
require("tabby").setup { tabline = tabline_config }
