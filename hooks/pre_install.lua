function PLUGIN:PreInstall(ctx)
    local version = ctx.version
    local url="https://github.com/bats-core/bats-support/archive/refs/tags/v" .. version .. ".tar.gz"

    return {
        version = version,
        url = url,
        note = "Installing bats-support " .. version,
    }
end
