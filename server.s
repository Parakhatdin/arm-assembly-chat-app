			.section	.data

server_addr:		.hword 		2 		//AF_INET (IPv4)
			.zero		1
			.byte		61
			.word 		0
			.zero		8

			.section	.bss
server_sockfd:		.byte		0


			.section	.text
			.global		main
main:

			mov		x0, #2 				// creating socket
			mov		x1, #1
			mov		x2, #6
			mov		x8, #198
			svc		0

			adr		x1, server_sockfd
			str		x0, [x1]

			adr		x1, server_sockfd
			ldr		x0, [x1]
			ldr		x1, =server_addr
			mov		x2, #16
			mov		x8, #200
			svc		0

			adr		x1, server_sockfd
			ldr		x0, [x1]				// changing status to listining
			mov		x1, #5
			mov		x8, #201
			svc		0

			

accept_loop:		adr		x1, server_sockfd
			ldr		x0, [x1]				// accepting 
			mov		x1, #0
			mov		x2, #0
			mov		x8, #202
			svc		0

			bl		accept_loop





			mov		x0, #0
			mov		x8, #93
			svc		0
