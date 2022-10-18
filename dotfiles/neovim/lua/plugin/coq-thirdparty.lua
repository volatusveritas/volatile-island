return {
    'ms-jpq/coq.thirdparty',
    requires = 'coq_nvim',
    config = function()
        require("coq_3p") {
            { src = "nvimlua", shot_name = "nLUA", conf_only = true },
        }
    end,
}
