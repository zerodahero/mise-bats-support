function PLUGIN:PostInstall(ctx)
    local cmd = require("cmd")
    local json = require("json")
    local file = require("file")

    local path = ctx.rootPath
    local destDir = file.join_path(path, "dist", "bats-support")
    cmd.exec("mkdir -p " .. destDir)
    cmd.exec("mkdir -p " .. file.join_path(destDir, "src"))

    print("Installing to " .. destDir)

    local success, output = pcall(
        cmd.exec,
        string.format("install -m755 %s %s", file.join_path(path, "load.bash"), file.join_path(destDir, "load.bash"))
    )
    if not success then
        print(output)
        error("Failed to install load.bash")
    end

    success, output = pcall(
        cmd.exec,
        string.format("for fn in %s/src/*.bash; do install -m755 $fn %s/src/$(basename $fn); done", path, destDir)
    )
    if not success then
        print(output)
        error("Failed to install support libs")
    end
end
