local ResLib = require "reslib"
local coroutine = require "skynet.coroutine"

local M = {}

function M.test()
    local ss = table.concat({"a", "b", "c"}, "")
    local t = {
        aa = ss,
    }
    -- print(t.aa, t.aa == "abc")
    local res = ResLib.get_entry("effect_action")
    local f = res.effect_action[1].test_func
    f(print, t)
end

return M
