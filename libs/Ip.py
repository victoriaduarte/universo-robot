import socket

def get_ip():
    hostname = socket.gethostname()
    IPAddr = socket.gethostbyname(hostname)

    print("Your computer name is:" + hostname)
    print("Your computer IP address is:" + IPAddr)

    return IPAddr