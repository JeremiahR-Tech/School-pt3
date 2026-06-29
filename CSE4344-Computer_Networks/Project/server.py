# Jeremiah Richard
# ID: 1001475742
# CSE4344


# Import socket module
import socket
# Import thread module
import threading

# Create a TCP server socket
serverSocket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)  

# Assign a port number
serverPort = 8080
SERVER = socket.gethostbyname( socket.gethostname() )
ADDR = (SERVER,serverPort )

# Bind the socket to server address and server port
serverSocket.bind( ADDR )

# Listen to at most 5 connection at a time
serverSocket.listen(5)

# Server should be up and running and listening to the incoming connections
def multi_thread(connectionSocket):
    try:
        print("Inside of multi_thread")
        # Extract the path of the requested object from the message
        message = connectionSocket.recv(1024).decode('utf-8')
        message = message.split()[1]
        f = open(message,'rb')

        # Store the entire contenet of the requested file in a temporary buffer
        outputdata = f.read()

        # Send the HTTP response header line to the connection socket
        connectionSocket.send( "HTTP/1.1 200 OK\r\n\r\n" )

        # Send the content of the requested file to the connection socket
        for i in range( 0, len(outputdata) ):  
            connectionSocket.send( outputdata[i] )
        connectionSocket.send("\r\n")
    except IOError:
        connectionSocket.send( "HTTP/1.1 404 Not Found\r\n\r\n" )
        connectionSocket.send("<html><head></head><body><h1>404 Not found</h1></body></html>\r\n")

    # Close the socket in case of some issues 
    connectionSocket.close()


while True:
    '''This part is for multi threading'''
    print('Ready to serve')
    '''Start the new thread'''
    conn, addr = serverSocket.accept()
    print('Pass socket accept')
    thread = threading.Thread( target=multi_thread, args=serverSocket )
    thread.start()

serverSocket.close()




