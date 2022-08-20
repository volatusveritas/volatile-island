local on_attach = function(client, bufnr)
    local bufopts = {noremap=true, silent=true, buffer=bufnr}
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', vim.g.mapleader..'rn', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', vim.g.mapleader..'f', vim.lsp.buf.formatting, bufopts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
    vim.keymap.set(
        'n', vim.g.mapleader..'D', vim.lsp.buf.type_definition, bufopts
    )
    vim.keymap.set(
        'n', vim.g.mapleader..'ca', vim.lsp.buf.code_action, bufopts
    )
end

local default_langs = {
    -- LSPConfig server names
    "clangd",
    "cssls",
    "gdscript",
    "html",
    "ltex",
    "powershell_es",
    "pyright",
    "tsserver",
}

require("mason-lspconfig").setup{
    automatic_installation = true,
}

-- Default langs setup
local coq = require("coq")
for _, lang in ipairs(default_langs) do
    require("lspconfig")[lang].setup(coq.lsp_ensure_capabilities{
        on_attach = on_attach,
        single_file_support = true,
    })
end

-- Custom langs setup
require("lspconfig")["sumneko_lua"].setup(coq.lsp_ensure_capabilities{
    on_attach = on_attach,
    single_file_support = true,
    settings = { Lua = {
        diagnostics = {
            globals = {"vim", "minetest"},
        },
        completion = {
            callSnippet = "Both",
            keywordSnippet = "Both",
        },
        hint = {
            enable = true,
        },
        workspace = {
            library = {
                vim.fn.expand("$VIMRUNTIME/lua"),
                vim.fn.expand("$VIMRUNTIME/lua/vim/lsp"),
                "C:/Users/LUCAS/Documents/Games/minetest-5.6.0-win64/builtin",
            },
        },
    }}
})

require("lspconfig")["pyright"].setup(coq.lsp_ensure_capabilities{
    on_attach = on_attach,
    single_file_support = true,
    root_dir = function(filename, bufnr)
        return vim.fs.dirname(
            vim.fs.find({".git", "pyproject.toml"}, {upward=true})[1]
        )
    end,
})
