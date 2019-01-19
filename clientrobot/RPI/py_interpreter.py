import json
import string
import serial
import time
import sys

ser = serial.Serial("/dev/ttyACM0", 9600)

if __name__ == "__main__":
    time.sleep(2)
    while 1:
        time.sleep(2)
        file = open("data.json", "r")
        data = file.read()
        file.close()

        if data:
            jsond = json.loads(data)
            dencode = str(jsond["data"])
            print(dencode)
            ser.write(str.encode(dencode))