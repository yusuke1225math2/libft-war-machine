/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: jtoty <jtoty@student.42.fr>                +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2017/02/28 12:01:40 by jtoty             #+#    #+#             */
/*   Updated: 2021/02/27 01:45:19 by lmartin          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include "../../../libft.h"
#include <stdio.h>

void	ft_print_result(const char *s)
{
	int		len;

	len = 0;
	while (s[len])
		len++;
	write(1, s, len);
}

int		main(int argc, const char *argv[])
{
	const char *str;
	int			arg;

	alarm(5);
	if (argc == 1)
		return (0);
	else if ((arg = atoi(argv[1])) == 1)
	{
		str = ft_memchr("bonjour", 'b', 4);
		if (!str)
			ft_print_result("NULL");
		else
			ft_print_result(str);
	}
	else if (arg == 2)
	{
		str = ft_memchr("bonjour", 'o', 7);
		if (!str)
			ft_print_result("NULL");
		else
			ft_print_result(str);
	}
	else if (arg == 3)
	{
		str = ft_memchr("bonjourno", 'n', 2);
		if (!str)
			ft_print_result("NULL");
		else
			ft_print_result(str);
	}
	else if (arg == 4)
	{
		str = ft_memchr("bonjour", 'j', 6);
		if (!str)
			ft_print_result("NULL");
		else
			ft_print_result(str);
	}
	else if (arg == 5)
	{
		str = ft_memchr("bonjour", 's', 7);
		if (!str)
			ft_print_result("NULL");
		else
			ft_print_result(str);
	}
	else if (arg == 6)
	{
		const unsigned char tab[] = {0x31, 0xff, 0x00};

		if (ft_memchr(tab, 0xff, 2) == tab + 1)
			write(1, "1", 1);
		else
			write(1, "0", 1);
	}
       	return (0);
}
