import json
import string
import time
import sys

if __name__ == "__main__":

    while 1:
        djson = {"data": "0"}
        jsond = json.dumps(djson)
        file = open("Script/clientexo/resources/data.json", "w")
        file.write(jsond)
        file.close()