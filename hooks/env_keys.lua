function PLUGIN:EnvKeys(ctx)
    local file = require("file")
    return {
        {
            key = "BATS_LIB_PATH",
            value = file.join_path(ctx.path, "dist"),
        },
    }
end
