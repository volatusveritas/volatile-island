return {
    'ms-jpq/coq_nvim',
    branch = 'coq',
    commit = '84ec5faf2aaf49819e626f64dd94f4e71cf575bc',
    config = function()
        vim.g.coq_settings = {
            auto_start = "shut-up",
            display = {
                pum = {
                    fast_close = false,
                },
                preview = {
                    border = "rounded"
                },
            },
        }

        require("coq")
    end
}
