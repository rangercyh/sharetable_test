local Skynet = require "skynet"
local sharetable = require "skynet.sharetable"

local tunpack = table.unpack
local tconcat = table.concat

local respath = Skynet.getenv "respath"
local sharedata_list_path = respath.."/sharedata_list.lua"

local M = {}
local cached_table = {}
local cached_sharedata_list
function M.get_entry(name)
    if cached_table[name] then
        return cached_table[name]
    end
    if not(cached_sharedata_list) then
        cached_sharedata_list = sharetable.query(sharedata_list_path)
    end
    local path = cached_sharedata_list and cached_sharedata_list[name]
    local t = path and sharetable.query(respath..'/'..path)
    if t then
        cached_table[name] = t
        return t
    end
end

function M.preload()
    if not(cached_sharedata_list) then
        cached_sharedata_list = sharetable.query(sharedata_list_path)
    end
    for k, path in pairs(cached_sharedata_list) do
        print('example preload res', respath..'/'..path)
        local t = sharetable.query(respath..'/'..path)
        if t then
            cached_table[k] = t
        end
    end
end

function M.reload_table()
    local update_list = { sharedata_list_path }
    local path
    for name, _ in pairs(cached_table) do
        path = cached_sharedata_list and cached_sharedata_list[name]
        if path then
            update_list[#update_list + 1] = respath..'/'..path
        end
    end
    print('reload resource = ', tconcat(update_list))
    sharetable.update(tunpack(update_list))
end

return M
