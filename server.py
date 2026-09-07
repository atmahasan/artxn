import os
import socket

HOST = "0.0.0.0"
PORT = int(os.environ.get("PORT", "8080"))

server = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
server.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
server.bind((HOST, PORT))
server.listen(20)

print(f"Listening on {HOST}:{PORT}")

while True:
    conn, addr = server.accept()
    print("Connection:", addr)

    try:
        conn.sendall(b"Railway test server OK\n")
    finally:
        conn.close()
