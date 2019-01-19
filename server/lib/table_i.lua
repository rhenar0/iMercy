local json = require("json")

local Func = {}

local function InitTable()
    iMercy = {
        INFOS = {
            UDP = "nil",
            Version = "Forsaken",
            NumberVersion = "3.0",
            ProjectName = "iMercy",
            Name = "[SERVER]",
            Auteur = "Script : Hugo CHASSAING | Design : Yacine MAYHOUZ ; Samy SPAGNOL ; Noé PEUTOT | Diagramme : Noé PEUTOT |",
            IDServer = "1_001",
        },
        DEBUG = {
            Pe = "PENDING",
            Err = "ERROR",
            OK = "OK",
            CoErr = "ERROR : During the condition",
            Stats = "nil"
        },
        CLIENT = {
            ClientExo = {
                MsgReceive = "nil",
                MsgSend = "nil",
                ID = {
                    HOST = "nil",
                    PORT = "nil",
                    NAME = "EXO",
                    ID = 1,
                },
            },
            ClientRobot ={
                MsgReceive = "nil",
                MsgSend = "nil",
                ID = {
                    HOST = "nil",
                    PORT = "nil",
                    NAME = "MERCY",
                    ID = 2,
                },
            },
        },
        CONNECT = {
            PORT = {
                Base = 4815,
            },
            IP = {
                Base = "*",
            }
        }
    }

    local json = json.encode(iMercy)

    local file = io.open("resources/imercy.json", "w")
    file:write(json)
    file:close()
end

Func.InitTable = InitTable
return Func