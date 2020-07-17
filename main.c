/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: ckakuna <42.fr>                            +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2020/07/14 14:46:58 by ckakuna           #+#    #+#             */
/*   Updated: 2020/07/17 10:25:00 by ckakuna          ###   ########.fr       */
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

void	test_ft_strcmp(char *dest, char *src)
{
	printf("   Strcmp: %d\n", strcmp(dest, src));
	printf("Ft_strcmp: %d\n", ft_strcmp(dest, src));
}

void	test_ft_write(int fd, char *str)
{
	int i;

	i = 0;
	while (str[i])
	{
		ft_write(fd, &str[i], 1);
		i++;
	}
	i = 0;
	write(fd, "\n", 1);
	while (str[i])
	{
		write(fd, &str[i], 1);
		i++;
	}
	write(fd, "\n", 1);
}

int		main(int ac, char **av)
{
	int fd;

	if (ac == 3)
	{
		if ((strcmp("ft_strlen", av[1]) == 0) || (strcmp("strlen", av[1]) == 0))
			test_ft_strlen(av[2]);
		else if ((strcmp("ft_strcpy", av[1]) == 0) || (strcmp("strcpy", av[1]) == 0))
			test_ft_strcpy(av[2]);
		else
			printf("./a.out [NAME FUNCTION] [ARGUMENTS]\n");
	}
	else if (ac == 4)
	{
		if ((strcmp("ft_strcmp", av[1]) == 0) || (strcmp("strcmp", av[1]) == 0))
			test_ft_strcmp(av[2], av[3]);
		else if ((strcmp("ft_write", av[1]) == 0) || (strcmp("write", av[1]) == 0))
		{
			if (atoi(av[2]) > 0)
				test_ft_write(atoi(av[2]), av[3]);
			else
			{
				printf("./a.out [NAME FUNCTION] [ARGUMENTS]\n");
				return (0);
			}
			fd = open("./test_files/test_write.txt", O_RDWR);
			test_ft_write(fd, "This is string (^_^)\n");
			write(fd, "after func", 10);
			close(fd);
		}
		else
			printf("./a.out [NAME FUNCTION] [ARGUMENTS]\n");
	}
	else
		printf("./a.out [NAME FUNCTION] [ARGUMENTS]\n");
	return (0);
}