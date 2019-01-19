local socket = require("socket")
local json = require("json")
host = "192.168.43.195"
port = 1111

if arg then
    host = arg[1] or host
    port = arg[2] or port
end

udp = socket.udp()
udp:setsockname("0.0.0.0", 1111)
print("Lien creer avec l'ip [" ..host.. "] sur le port [" .. port .. "]")

udp:sendto("1", host, port)

while 1 do
    local jsonexo = io.open("lib/data.json", "r")
    local data = jsonexo:read()
    local data_previous = nil
    if data == '{"data": "0"}' then
        print("Data NIL")
    else
        if data ~= data_previous then
            local table = json.decode(data)
            print("Envoie de "..table["data"])
            udp:sendto(table["data"], host, port)
            data_previous = data
        else
            print("Data Previous : True")
        end
    end
    jsonexo:close()
end