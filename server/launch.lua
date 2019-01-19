print("Ceci est le serveur du projet iMercy. Projet réalisé par l'équipe iMercy : Noé, Samy, Yacine et Hugo")

local lib = require("lib/table_i")

print("Lancement du serveur...")
print("Reset des ressources")

lib.InitTable()

print("Execution du serveur...")

os.execute("lua server.lua 0.0.0.0 1111 true")
