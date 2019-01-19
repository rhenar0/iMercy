local b = require("lib/updatejson")
local socket = require("socket")
local udp = socket.udp()
local testudp_r = socket.udp()
local testudp_c = socket.udp()

local Func = {}

local function SendTo(ip, msg, port)
    local table = b.getjson()
    if ip == table["CLIENT"]["ClientExo"]["ID"]["HOST"] then
        b.updatejson("cl", msg, "ClientExo", "MsgSend")
        local temptable = b.getjson()
        print("Envoie vers CLIENTROBOT...")
        print(temptable["CLIENT"]["ClientExo"]["MsgSend"])
        testudp_c:setpeername(temptable["CLIENT"]["ClientExo"]["ID"]["HOST"], temptable["CLIENT"]["ClientExo"]["ID"]["PORT"])
        testudp_c:send(temptable["CLIENT"]["ClientExo"]["MsgSend"])
    elseif ip == table["CLIENT"]["ClientRobot"]["ID"]["HOST"] then
        b.updatejson("cl", msg, "ClientRobot", "MsgSend")
        local temptable = b.getjson()
        print("Envoie vers CLIENTEXO...")
        testudp_r:setpeername(temptable["CLIENT"]["ClientRobot"]["ID"]["HOST"], temptable["CLIENT"]["ClientRobot"]["ID"]["PORT"])
        testudp_r:sendto(temptable["CLIENT"]["ClientRobot"]["MsgSend"])
    end
end

local function InitID(msg, ip, port)
    local table = b.getjson()
    if msg == "1" then
        b.updatejson("cl", ip, "ClientExo", "ID","HOST")
        b.updatejson("cl", port, "ClientExo", "ID", "PORT")
        print("Connexion de "..table["CLIENT"]["ClientExo"]["ID"]["NAME"])
        print("Valeur envoye : "..msg)
        local tablet = b.getjson()
        testudp_c:setpeername(tablet["CLIENT"]["ClientExo"]["ID"]["HOST"], tablet["CLIENT"]["ClientExo"]["ID"]["PORT"])
        testudp_c:send("Connexion avec le serveur etablie !")
    elseif msg == "2" then
        b.updatejson("cl", ip, "ClientRobot", "ID","HOST")
        b.updatejson("cl", port, "ClientRobot", "ID", "PORT")
        print("Connexion de "..table["CLIENT"]["ClientRobot"]["ID"]["NAME"])
        local tablet = b.getjson()
        testudp_r:setpeername(tablet["CLIENT"]["ClientRobot"]["ID"]["HOST"], tablet["CLIENT"]["ClientRobot"]["ID"]["PORT"])
        testudp_r:send("Connexion avec le serveur etablie !")
    else
        print("Valeur reçu : "..msg)
    end
end

local function UDPMsg(msg, ip, port)
    local table = b.getjson()
    if table["CLIENT"]["ClientExo"]["ID"]["HOST"] == "nil" or table["CLIENT"]["ClientRobot"]["ID"]["HOST"] == "nil" then
        InitID(msg, ip, port)
    else
        SendTo(ip, msg, port)
    end
end

Func.UDPMsg = UDPMsg
return Func