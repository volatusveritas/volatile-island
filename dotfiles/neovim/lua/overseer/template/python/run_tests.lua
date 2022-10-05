return {
    name = "Python: Run Tests (unittest)",
    builder = function(_)
        return {
            cmd = { "python" },
            args = {
                "-m", "unittest", "discover", "-v",
                "-s", "tests/",
                "-p", "*",
            },
            components = {
                "on_complete_notify",
                "display_duration",
                "on_exit_set_status",
                "restart_on_save",
            },
        }
    end,
}
