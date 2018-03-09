# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: atemunov <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/03/03 14:28:29 by atemunov          #+#    #+#              #
#    Updated: 2018/03/03 15:19:21 by atemunov         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = hydra_test2

CC = gcc

SRCS = server.c

OBJS= $(patsubst %.c,%.o,$(SRCS))

CFLAGS = -Wall -Wextra -Werror

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

all: $(NAME)

$(NAME): $(OBJS)
	$(CC) $(OBJS) -o $(NAME)

clean:
	rm -rf $(OBJS)

fclean: clean
	rm -rf $(NAME)

re: fclean all

.PHONY: make all clean fclean re
