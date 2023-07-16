/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   client.c                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: ibellash <ibellash@student.42wolfsburg.    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/03/20 12:17:43 by ibellash          #+#    #+#             */
/*   Updated: 2023/07/16 15:35:43 by ibellash         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "minitalk.h"

void	ft_sender(int pid, char i)
{
	int	bit;

	bit = 0;
	while (bit < 8)
	{
		if ((i & (1 << bit)))
			kill(pid, SIGUSR1);
		else
			kill(pid, SIGUSR2);
		usleep(150);
		bit++;
	}
}

void	ft_send_message(int pid, char *message)
{
	while (*message)
		ft_sender(pid, *message++);
	ft_sender(pid, '\n');
}

int	main(int argc, char **argv)
{
	int	pid;

	if (argc != 3)
	{
		ft_printstr("Error: wrong format.\n");
		ft_printstr("Try: ./client <pid> <message>\n");
		return (1);
	}
	pid = ft_atoi(argv[1]);
	if (kill(pid, 0) == -1)
	{
		ft_printstr("Error: invalid PID.\n");
		return (1);
	}
	ft_send_message(pid, argv[2]);
	return (0);
}
