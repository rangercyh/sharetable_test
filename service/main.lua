local Skynet = require "skynet"

local function __init__()
    print("---------- launch start ------------")

    Skynet.uniqueservice("debug_console", 8000) -- 调试网关
    Skynet.uniqueservice("res_loader")  -- 配置表进程唯一
    for i = 1, 100 do
        Skynet.newservice("example", i)  -- 使用配置表的服务
    end

    print("---------- launch finished ------------")
end

Skynet.start(__init__)
