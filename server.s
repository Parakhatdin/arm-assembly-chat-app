					.section	.data

buffer:				.space		1024
server_addr:		.hword 		2 		//AF_INET (IPv4)
					.zero		1
					.byte		62
					.word 		0
					.zero		8

					.section	.bss
server_sockfd:		.byte		0
accept_sockfd:		.byte		0


					.section	.text
					.global		main

// ------------------------------------------------------------------------------------------------
// Main function
// ------------------------------------------------------------------------------------------------
main:
					bl		createSocket
					bl		bind
					bl		listen

whileTrue:			bl		accept
					bl		readFromClient
					bl		clearBuffer
					bl		writeToClient
					bl		closeAccept
					bl		closeServer



					// Exit the program
					mov		x0, #0
					mov		x8, #93
					svc		0

// ------------------------------------------------------------------------------------------------
// Create Socket
// ------------------------------------------------------------------------------------------------
createSocket:		
					mov		x0, #2 						// Address family (IPv4)
					mov		x1, #1						// Socket type (stream)
					mov		x2, #6						// Protocol IPPROTO_TCP
					mov		x8, #198					// Syscall number for bind()
					svc		0							// Make system call 
					adr		x1, server_sockfd			// Store server_sockfd address into x1
					str		x0, [x1]					// Store value from x0(socket file descriptor) into address from x1
					ret


// ------------------------------------------------------------------------------------------------
// Bind Socket
// ------------------------------------------------------------------------------------------------
bind:
					adr		x1, server_sockfd
					ldr		x0, [x1]
					ldr		x1, =server_addr
					mov		x2, #16
					mov		x8, #200
					svc		0
					ret


// ------------------------------------------------------------------------------------------------
// Listen Socket
// ------------------------------------------------------------------------------------------------
listen:
					adr		x1, server_sockfd
					ldr		x0, [x1]				// changing status to listining
					mov		x1, #5
					mov		x8, #201
					svc		0
					ret
			

// ------------------------------------------------------------------------------------------------
// Accept Socket
// ------------------------------------------------------------------------------------------------
accept:				
					adr		x1, server_sockfd
					ldr		x0, [x1]				// accepting 
					mov		x1, #0
					mov		x2, #0
					mov		x8, #202
					svc		0
					adr		x1, accept_sockfd		// Store accept_sockfd address into x1
					str		x0, [x1]				// Store value from x0(socket file descriptor) into address from x1
					ret


// ------------------------------------------------------------------------------------------------
// Read Socket
// ------------------------------------------------------------------------------------------------
readFromClient:
					adr		x1, accept_sockfd
					ldr		x0, [x1]
					adr		x1, buffer
					mov		x2, #1024
					mov		x8, #63
					svc		0

					mov		x0, #1
					adr		x1, buffer
					mov		x2, #1024
					mov		x8, #64
					svc		0

					ret


// ------------------------------------------------------------------------------------------------
// PrintAcceptedValue
// ------------------------------------------------------------------------------------------------
writeToClient:		
					mov		x0, #0
					adr		x1, buffer
					mov		x2, #1024
					mov		x8, #63
					svc		0

					adr		x1, accept_sockfd
					ldr		x0, [x1]
					adr		x1, buffer
					mov		x2, #1024
					mov		x8, #64
					svc		0

					ret


// ------------------------------------------------------------------------------------------------
// CloseAccept
// ------------------------------------------------------------------------------------------------
closeAccept:		
					adr		x1, accept_sockfd
					ldr		x0, [x1]
					mov		x8, #57
					svc		0
					ret


// ------------------------------------------------------------------------------------------------
// CloseServer
// ------------------------------------------------------------------------------------------------
closeServer:		
					adr		x1, server_addr
					ldr		x0, [x1]
					mov		x8, #57
					svc		0
					ret


clearBuffer:
					mov		x0, #0
					adr		x1, buffer
					mov		x2, #1024
clearLoop:				
					str		x0, [x1], #8
					subs	x2, x2, #8
					bne		clearLoop
					ret

