# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    killmanger.sh                                      :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: atemunov <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/04/14 16:16:44 by atemunov          #+#    #+#              #
#    Updated: 2018/04/14 16:28:22 by atemunov         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

./manger &

kill -9 $(pgrep yes xanthos ruins lampon crap)
kill -9 $(top -l 1 | grep manger | awk '{print $1}')

rm -rf ./crap*

gcc ./ponies.c -o pony
./pony &

kill -9 $(pgrep pony)
