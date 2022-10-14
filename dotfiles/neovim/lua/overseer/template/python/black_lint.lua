return {
    name = "Python: Lint (black)",
    builder = function(_)
        local src = vim.fn.input("Source path to lint: ")
        return {
            cmd = { "python" },
            args = {
                "-m", "black",
                "-t", "py310",
                "-l", "79",
                src
            },
            components = {
                "on_complete_notify",
                "display_duration",
                "on_exit_set_status",
            },
        }
    end,
}
