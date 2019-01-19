local socket = require("socket")
local json = require("json")
host = "142.93.96.89"
port = 1111

if arg then
    host = arg[1] or host
    port = arg[2] or port
end

udp = socket.udp()
udp:setsockname("0.0.0.0", 1111)
print("Lien creer avec l'ip [" ..host.. "] sur le port [" .. port .. "]")

udp:sendto("2", host, port)

while 1 do
    tempo, ip, port = udp:receivefrom()
    if tempo then
        tablep = {
            data = tempo
        }
        local jsoncl = io.open("data.json", "wb")
        jsoncl:write(tempo)
        jsoncl:close()
    end
end