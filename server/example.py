from email import message
import socket

ip = socket.gethostbyname(socket.gethostname())
print(ip)

#ip = "192.168.56.1"
port = 5001

sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
sock.connect((ip,port))

message = 'hello'
sock.send(message.encode())
sock.close()
