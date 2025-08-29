function PLUGIN:Available(ctx)
    local http = require("http")
    local json = require("json")

    local resp, err = http.get({
        url = "https://api.github.com/repos/bats-core/bats-support/tags",
    })

    if err ~= nil then error("Failed to fetch versions: " .. err) end

    local versions = json.decode(resp.body)
    local result = {}

    for i, v in ipairs(versions) do
        local version = v.name:gsub("^v", "") -- Remove 'v' prefix

        table.insert(result, {
            version = version,
            note = nil,
            addition = {
                {
                    name = "bats-support",
                    version = v.name,
                },
            },
        })
    end

    return result
end
