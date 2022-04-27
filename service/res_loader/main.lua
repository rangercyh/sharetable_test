local Skynet    = require "skynet"
local sharetable = require "skynet.sharetable"

local cmd = {}

local respath =  Skynet.getenv "respath"

local function get_share_list(file)
    local path = respath .. "/" .. file
    return loadfile(path, "bt", {})()
end

local last = {
    memory = 0,
    proc_mem = 0,
}

local function reload_resource(reload)
    local total_size = 0
    local extra = get_share_list("sharetable_list.lua")
    total_size = total_size + sharetable.loadfile(respath .. "/sharetable_list.lua")
    local rel_path
    for _, path in pairs(extra) do
        rel_path = respath .. "/" .. path
        print("sharetable loadfile path:", rel_path)
        total_size = total_size + sharetable.loadfile(rel_path)
    end
    if reload then
        print("resource reload broadcast")
        for i = 1, 100 do
            Skynet.call('example' .. i, "lua", "reload_resource")
        end
    end
    local info = sharetable.info()
    print(string.format("resource loaded!\n\z
            conf file size<%s Kb>\n\z
            sharetable file size<%s Kb> c memory<%s Kb> increase c mem<%s Kb>\n\z
            process c memory<%s Kb> increase c mem<%s Kb>",
            total_size / 1024,
            info.total_size / 1024, info.memory / 1024, (info.memory - last.memory) / 1024,
            info.proc_mem / 1024, (info.proc_mem - last.proc_mem) / 1024))
    last.proc_mem = info.proc_mem
    last.memory = info.memory
end

function cmd.reload(reload)
    reload_resource(reload)
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

