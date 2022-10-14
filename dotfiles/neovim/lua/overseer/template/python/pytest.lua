return {
    name = "Python: Run Tests (pytest)",
    builder = function(_)
        return {
            cmd = { "pytest" },
            components = {
                "on_complete_notify",
                "display_duration",
                "on_exit_set_status",
                "restart_on_save",
            },
        }
    end,
}
