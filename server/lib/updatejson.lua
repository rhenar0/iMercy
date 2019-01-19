local json = require("json")
local Func = {}

local function updatejson(type, varsend, var1, var2, var3)
    local file = io.open("resources/imercy.json", "r")
    local tablejson = json.decode(file:read())
    file:close()

    if type == "debug" then
        tablejson["DEBUG"][var1] = varsend
        local jt = json.encode(tablejson)
        local jsonfile = io.open("resources/imercy.json", "w")
        jsonfile:write(jt)
        jsonfile:close()
    elseif type == "co" then
        --print(varsend)
        tablejson["CONNECT"][var1][var2] = varsend
        --print(tablejson[table][var1][var2])
        local jt = json.encode(tablejson)
        local jsonfile = io.open("resources/imercy.json", "w")
        jsonfile:write(jt)
        jsonfile:close()
    elseif type == "cl" then
        if var3 then
            tablejson["CLIENT"][var1][var2][var3] = varsend
        else
            tablejson["CLIENT"][var1][var2] = varsend
        end
        local jt = json.encode(tablejson)
        local jsonfile = io.open("resources/imercy.json", "w")
        jsonfile:write(jt)
        jsonfile:close()
    end
    
end

local function getjson(var)
    if var == nil then
        while 1 do
        local file = io.open("resources/imercy.json")
        local table = json.decode(file:read())
        return table
        end
    elseif var == "close" then
        file:close()
    end
end

Func.getjson = getjson
Func.updatejson = updatejson

return Func