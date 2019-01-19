import json
import string
import serial
import time
import sys

ser = serial.Serial("/dev/ttyACM0", 9600)

if __name__ == "__main__":

    while 1:
        data = ser.readline()
        print("Hello")
        if data:
            djson = {"data": data}
            jsond = json.dumps(djson)
            file = open("data.json", "w")
            file.write(jsond)
            file.close()