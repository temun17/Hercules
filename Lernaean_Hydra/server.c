/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   server.c                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: atemunov <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2018/03/03 14:28:18 by atemunov          #+#    #+#             */
/*   Updated: 2018/03/05 20:08:13 by atemunov         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <stdlib.h>
#include <unistd.h>
#include <stdio.h>
#include <sys/socket.h>
#include <sys/types.h>
#include <netinet/in.h>

int	main()
{
	char server_message[256];
	
	/* Create the server socket */
	int server_socket;
	server_socket = socket(AF_INET, SOCK_STREAM, 0); // Keeps protocal set to 0
	
	/* Define the server address */
	struct sockaddr_in server_address;
	server_address.sin_family = AF_INET;
	server_address.sin_port = htons(4022);
	server_address.sin_addr.s_addr = INADDR_ANY;
	
	/* Bind the socket to our specified IP and port */
	bind(server_socket, (struct sockaddr*) &server_address, sizeof(server_address));

	/* Listen for connection and 2nd argument is a backlog to locate how many connections are essentially waiting */
	listen(server_socket, 10);
	

	/* Create a infinite running program that sends and recieves message back to the server. If the message is equal to "ping", the server will print to the client's file descriptor "Pong Pong" */
	int 	find_size;
	char	client_message[BUFF_SIZE];
	
	while ((find_size = recv(client_socket, client_message, BUFF_SIZE, 0)) > 0)
	{
		if (!(strncmp(client_message, "ping", 4)) \
				&& (client_message[5] == '\n' || client_message == '\0'))
			putendl_fd("pong pong", client_socket);
		bzero(client_message, BUFF_SIZE);
	}
		client_socket = accept(server_socket, NULL, NULL);
		// send the message
		recv(client_socket, server_message, sizeof(server_message), 0);
		//close the socket
		recv_message(client_socket);
	return (0);
}
