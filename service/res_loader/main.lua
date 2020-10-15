local Skynet    = require "skynet"
local sharetable = require "skynet.sharetable"

local cmd = {}

local respath =  Skynet.getenv "respath"

local function get_share_list(file)
    local path = respath .. "/" .. file
    return loadfile(path, "bt", {})()
end

local function reload_resource()
    local extra = get_share_list("sharedata_list.lua")
    sharetable.loadfile(respath .. "/sharedata_list.lua")
    local rel_path
    for _, path in pairs(extra) do
        rel_path = respath .. "/" .. path
        print("sharetable loadfile path:", rel_path)
        sharetable.loadfile(rel_path)
    end
    print("resource loaded!")
end

function cmd.reload()
    reload_resource()
    print("resource reload broadcast")
    Skynet.send('example', "lua", "reload_resource")
    Skynet.retpack(true)
end

Skynet.start(function()
    Skynet.dispatch("lua", function(session, address, name, ...)
        local func = assert(cmd[name], name)
        func(...)
    end)

    Skynet.cache.mode "OFF"
    reload_resource()

    print("res_loader booted", Skynet.self())
end)

