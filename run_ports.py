import socket

def list_running_ports():
    open_ports = []
    for port in range(1, 65536):  # Ports range from 1 to 65535
        sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        sock.settimeout(1)  # Adjust the timeout as needed
        result = sock.connect_ex(('127.0.0.1', port))  # Check if the port is open
        if result == 0:
            open_ports.append(port)
        sock.close()
    return open_ports

if __name__ == "__main__":
    open_ports = list_running_ports()
    if open_ports:
        print("Open ports on the local machine:")
        for port in open_ports:
            print(port)
    else:
        print("No open ports found.")

