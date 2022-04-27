local Skynet = require 'skynet'
require "skynet.manager"
local ResLib = require "reslib"
local test = require "test"

local idx = ...

local Command = {}

function Command.reload_resource()
    print('example reload_resouce')
    ResLib.reload_table()
    Skynet.retpack(true)
end

local function __init__()
    Skynet.dispatch('lua', function(session, address, cmd, ...)
        local f = assert(Command[cmd], cmd)
        f(...)
    end)
    Skynet.register("example" .. idx)
    print('example booted', Skynet.self())
end

Skynet.start(__init__)

Skynet.init(function()
    ResLib.preload()
    test.test()
end, "reslib_preload")
