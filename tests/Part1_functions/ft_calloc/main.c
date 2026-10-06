/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: jtoty <jtoty@student.42.fr>                +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2017/02/28 12:23:17 by jtoty             #+#    #+#             */
/*   Updated: 2019/10/09 08:56:23 by lmartin          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <stdlib.h>
#include <unistd.h>
#include "../../../libft.h"

int		main(int argc, const char *argv[])
{
	char	*str;

	alarm(5);
	if (argc == 1)
		return (0);
	else if (atoi(argv[1]) == 1)
	{
		str = (char *)ft_calloc(30, 1);
		if (!str)
			write(1, "NULL", 4);
		else
			write(1, str, 30);
	}
	else if (atoi(argv[1]) == 2)
	{
		str = ft_calloc(0, 8);
		write(1, str ? "OK" : "NULL", str ? 2 : 4);
		free(str);
	}
	else if (atoi(argv[1]) == 3)
	{
		str = ft_calloc(8, 0);
		write(1, str ? "OK" : "NULL", str ? 2 : 4);
		free(str);
	}
	else if (atoi(argv[1]) == 4)
	{
		str = ft_calloc((size_t)-1, 2);
		write(1, str ? "BAD" : "OK", str ? 3 : 2);
		free(str);
	}
	else if (atoi(argv[1]) == 5)
	{
		char *other;

		str = ft_calloc(0, 1);
		other = ft_calloc(0, 1);
		write(1, str && other && str != other ? "OK" : "BAD", str && other && str != other ? 2 : 3);
		free(str);
		free(other);
	}

	return (0);
}
