return {
    'williamboman/mason-lspconfig.nvim',
    after = { 'nvim-lspconfig', 'coq_nvim' },
    requires = {
        'williamboman/mason.nvim',
        'neovim/nvim-lspconfig'
    },
    config = function()
        require("plugconfig.lspconfig")
    end,
}
