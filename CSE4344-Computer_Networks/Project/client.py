# Jeremiah Richard 
# ID: 1001475742
# CSE4344

import socket
from time import *
import sys
import time


HOST=socket.gethostbyname( socket.gethostname() )
PORT=8080
fileName="DEBUG.txt"
ADDR = (HOST,PORT)


clientSocket = socket.socket(socket.AF_INET,socket.SOCK_STREAM)

print('Client has been established')

clientSocket.connect(ADDR)
# connect the host and port to the socket
send_time = time.time()
clientSocket.send(fileName)


data=clientSocket.recv(1024)
recv_time = time.time()
RTT = recv_time - send_time
print(f'Data received by the client is {data}')
print(f'RTT: {RTT}')

'''Print other vvalues here '''
''' close socket '''
clientSocket.close()