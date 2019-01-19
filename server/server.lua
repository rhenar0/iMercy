print("---------------------")
print("[SERVER] Init des modules : ...")

local c = require("lib/udpsend")
local b = require("lib/updatejson")
local json = require("json")
local socket = require("socket")
local udp = assert(socket.udp())

print("[SERVER] Init des modules : OK")
print("[SERVER] Utilisation des arguments : ...")

if arg then
    b.updatejson("co", arg[1], "IP", "Base")
    print("[ARG_ONE] '"..arg[1].."'")

    b.updatejson("co", arg[2], "PORT", "Base")
    print("[ARG_TWO] '"..arg[2].."'")

    b.updatejson("debug", arg[3], "Stats")
    print("[ARG_THREE] '"..arg[3].."'")
end

print("[SERVER] Utilisation des arguments : OK")
print("[SERVER] Reservation de l'IP '"..arg[1].."' avec le port '"..arg[2].."' : ...")

table = b.getjson()
assert(udp:setsockname(table["CONNECT"]["IP"]["Base"], table["CONNECT"]["PORT"]["Base"]))
--assert(udp:setpeername(table["CONNECT"]["IP"]["Base"], table["CONNECT"]["PORT"]["Base"]))
--assert(udp:settimeout(20))
print("[SERVER] Reservation de l'IP '"..arg[1].."' avec le port '"..arg[2].."' : OK")

print("[SERVER] En attente d'un message...")
while 1 do
    Tempo, ip, port = udp:receivefrom()

    c.UDPMsg(Tempo, ip, port)
end
