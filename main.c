/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: ckakuna <42.fr>                            +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2020/07/14 14:46:58 by ckakuna           #+#    #+#             */
/*   Updated: 2020/07/14 14:52:39 by ckakuna          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libasm.h"

void	test_ft_strlen(char *str)
{
	printf("   Strlen: %lu\n", strlen(str));
	printf("Ft_strlen: %d\n", ft_strlen(str));
}

void	test_ft_strcpy(char *src)
{
	char *dst = (char *)malloc(sizeof(char) * (strlen(src) + 1));
	printf("   Strcpy: %s\n", strcpy(dst, src));
	printf("Ft_strcpy: %s\n", ft_strcpy(dst, src));
}

int		main(int ac, char **av)
{
	if (ac == 3)
	{
		if ((strcmp("ft_strlen", av[1]) == 0) || (strcmp("strlen", av[1]) == 0))
			test_ft_strlen(av[2]);
		else if ((strcmp("ft_strcpy", av[1]) == 0) ||
		(strcmp("strcpy", av[1]) == 0))
			test_ft_strcpy(av[2]);
		else
			printf("./a.out [NAME FUNCTION] [ARGUMENT]\n");
	}
	else
		printf("./a.out [NAME FUNCTION] [ARGUMENT]\n");
	return (0);
}