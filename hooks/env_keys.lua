function PLUGIN:EnvKeys(ctx)
    local file = require("file")
    local strings = require("strings")

    local lib_path = file.join_path(ctx.path, "dist")

    local env_path = os.getenv("BATS_LIB_PATH")
    local new_path = ""

    if env_path == nil or env_path == "" or strings.contains(env_path, lib_path) then
        new_path = lib_path
    else
        new_path = env_path .. ":" .. lib_path
    end

    return {
        {
            key = "BATS_LIB_PATH",
            value = new_path,
        },
    }
end
