local M = {}

local config_path = vim.fn.stdpath("config")
local init_path = config_path .. "/lua/init"
local plugin_path = config_path .. "/lua/plugin"
local plugconfig_path = config_path .. "/lua/plugconfig"

if vim.fn.finddir("lua", config_path) == "" then
    vim.fn.mkdir(config_path .. "/lua")
    vim.fn.mkdir(init_path)
    vim.fn.mkdir(plugin_path)
end


local function call_formatted(item, _, format_func, callback)
    if not item then
        return
    end

    callback(format_func(item))
end


local function goto_file(path)
    vim.cmd("edit " .. path)
end


local function create_file(path)
    vim.fn.writefile({}, path)
end


function M.editor_config()
    vim.ui.select(
        { "home", "general", "plug", "mappings", "volavim", "folding" }, {},
        function(item, idx)
            call_formatted(
                item, idx,
                function(name)
                    if name == "home" then
                        return config_path .. "/init.lua"
                    end

                    return init_path .. "/" .. name .. ".lua"
                end,
                goto_file
            )
        end
    )
end


function M.editor_plugin_config()
    local plugin_config_files = {}
    local extsize = #".lua"

    for name in vim.fs.dir(plugin_path) do
        table.insert(
            plugin_config_files,
            name:sub(1, #name - extsize)
        )
    end

    vim.ui.select(
        plugin_config_files, {},
        function(item, idx)
            call_formatted(
                item, idx,
                function(name)
                    return plugin_path .. "/" .. name .. ".lua"
                end,
                goto_file
            )
        end
    )
end


function M.editor_plugin_plugconfig()
    local plugin_plugconfig_files = {}
    local extsize = #".lua"

    for name in vim.fs.dir(plugconfig_path) do
        table.insert(
            plugin_plugconfig_files,
            name:sub(1, #name - extsize)
        )
    end

    vim.ui.select(
        plugin_plugconfig_files, {},
        function(item, idx)
            call_formatted(
                item, idx,
                function(name)
                    return plugconfig_path .. "/" .. name .. ".lua"
                end,
                goto_file
            )
        end
    )
end


function M.editor_plugin_new()
    vim.ui.input(
        { prompt = "Plugin file name" },
        function(input)
            create_file(plugin_path .. "/" .. input .. ".lua")
        end
    )
end


return M
