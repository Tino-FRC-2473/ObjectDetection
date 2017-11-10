#include <cstdio>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <cstring>
#include <unistd.h>
#include <cstdlib>

using namespace std;

void error(char *msg){
	perror(msg);
	std::exit(EXIT_FAILURE);
	//abort();
}

int main(int argc, char *argv[]){
	int sockfd; //file descriptor
	int newsockfd; //file descriptor
	int portno = 6789; //stores the port number in whic the server accepts connetions
	socklen_t clientAddressLength; //length of the address of the client
	int ret; //return values for the read() and write calls, contains number of characters read/written

	char buffer[256]; //this is where the characters read from connections is stored???

	//struct is a data structure, group of elements into one name
	struct sockaddr_in server_address;
	struct sockaddr_in client_address;
	/*sockaddr_in defined in <netinet/in.h>
	definition:

	struc sockaddr_in{
		short sin_family;
		u_short sin_port;
		struct in_addr sin_addr;
		char sin_zero[8];
	};*/

	//if the user does not pass in the port number, display error message
	/*if(argc < 2){
		fprintf(stderr, "ERROR, no port provided\n");
		exit(1);
	}*/


	/**int socket(int domain, int type, int protocol)*/
	//domain: protocol family IDK what exactly this is but can be AF_INET or AF_INET6
	//type: protocol type (SOCK_STREAM for stream SOCK_DGRAM for dgram)
	//protocol: usually 0 to set it to indicate type of protocol used
	//returns the file descriptor and -1 if fails
	sockfd = socket(AF_INET, SOCK_STREAM, 0);
	if(sockfd < 0){
		error("ERROR opening socket");
	}

	//bzero(void* block, size_t size) I'm actually using memset yay
	//sets all values in a buffer to zero, pointer to buffer, s
	memset((struct sockaddr *)&server_address, 0, sizeof(server_address));
	//WE NEED TO FIX THIS LATER

	//sets the port to the argument passed?
	//portno = atoi((argv[1]);

	//sets the sin_family field of the struct sockaddr_in server_address to AF_INET
	server_address.sin_family = AF_INET;

	//sets the sin_addr field of the struct sockaddr_in server_address to INADDR_ANY
	//the sin_addr field contains the IP adress of the host and INADDR_ANY gets this address
	server_address.sin_addr.s_addr = htonl(INADDR_ANY);

	server_address.sin_port = htons(portno);


	/**int bind(int fd, struct soccaddr *local_addr, socklen_t addr_length) */
	//want to associate that socket with a port on machine. The port is used by the kernal to match the packet with the socket descriptor
	//call bind with the address of the local host and the port on which it will listen for connections
	//take file descriptor from socket()
	//returns 0 on success and -1 on fail
	int bindfd = bind(sockfd, (struct sockaddr *)&server_address, sizeof(server_address));

	//if binding fails, send error
	if(bindfd < 0){
		error("ERROR on binding");
	}

	/**int listen(int fd, int queue_size) */
	//fd: socket
	//queue_size: maximum number of queued (arranged in a list) (usually is 5 for most systems)
	//listens on the socket for connections
	//returns 0 on success and -1 on fail
	listen(sockfd, 5);

	/**int accept(int fd, struc sockaddr *remote_host, socklen_t addr_length)*/
	//accepts a connection on a bound socket and writes the connecting client's address info
	//creates a new socket (not in listening state) original socket is not affected
	//returns a new socket file descriptor for accepeted for the accepted connection or -1 for error
	//original file descriptor used to accept new connections
	//new file descriptor used to communicate with connected client
	clientAddressLength = sizeof(client_address);
	newsockfd = accept(sockfd, (struct sockaddr *) &client_address, &clientAddressLength);


	if(newsockfd < 0){
		error("ERROR on accept");
	}

	//initializes the buffer using the bzero() function
	bzero(buffer, 256);
	//memset(buffer, 0, sizeof(buffer));
	//WE NEED TO FIX THIS LATER

	//reads from the socket
	//the read method uses the new file descriptor
	ret = read(newsockfd, buffer, 255);
	if(ret < 0) error("ERROR reading from socket");
	printf("Here is the message:%s\n", buffer);

	//write(int fd, const void *buffer, size_t size)
	ret = write(newsockfd, "I got your message", 18);
	if(ret < 0) error("ERROR writing to socket");


	/***************EVERYTHING BELOW IS NOT AS NEEDED***********/
	/**int connect(int fd, struct sockaddr *remote_host, socklen_t addr_length)*/
	//connects socket to remote host and programs
	//stay stuck on this method until it returns something (blocking call)
	//returns 0 on sucess and -1 on fail

	/**int send(int fd, void *buffer, size_t n, int flags)*/
	//sends n bytes from *buffer to socket fd
	//buffer: temporary memory space where the data is stored while being processed or transferred
	//returns number of bytes sent of -1 on fail

	/**int receive(int fd, void *buffer, size_t n, int flags)*/
	//receives n bytes from the socket file descriptor into bugger
	//blocking call, blocking: waiting for data to appear
	//returns number on bytes received of -1 on fail
}
