local Skynet = require "skynet"

local function __init__()
    print("---------- launch start ------------")

    Skynet.uniqueservice("debug_console", 8000) -- 调试网关
    Skynet.uniqueservice("res_loader")  -- 配置表进程唯一
    Skynet.uniqueservice("example")  -- 使用配置表的服务

    print("---------- launch finished ------------")
end

Skynet.start(__init__)
