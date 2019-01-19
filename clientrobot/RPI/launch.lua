--local lib = require("lib/table_i")

print("Lancement du client du robot...")
print("Check des ressources...")

--lib.InitTable()

print("Reset des ressources !")
print("Execution du client du robot...")

os.execute("lua client.lua 0.0.0.0 1111 true")