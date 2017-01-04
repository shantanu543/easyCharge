 #!/usr/bin/env python

import serial
import time

ser = serial.Serial('/dev/ttyACM0',9600)

file = open('battery.txt')
while 1:
	file = open('battery.txt')
	line = file.readline()
	if not line:
		break
	ser.write(line)
	file.close()
