/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: ckakuna <42.fr>                            +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2020/07/14 14:46:58 by ckakuna           #+#    #+#             */
/*   Updated: 2020/07/17 14:37:40 by ckakuna          ###   ########.fr       */
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

void	test_ft_write(char *str)
{
	int i, fd;

	i = 0;
	fd = open("./test_files/test_write.txt", O_RDWR);
	while (str[i])
	{
		ft_write(fd, &str[i], 1);
		ft_write(1, &str[i], 1);
		i++;
	}
	i = 0;
	ft_write(fd, "\n\n", 2);
	ft_write(1, "\n\n", 2);
	while (str[i])
	{
		write(fd, &str[i], 1);
		write(1, &str[i], 1);
		i++;
	}
	ft_write(fd, "\n\n", 2);
	ft_write(1, "\n\n", 2);
	close(fd);
}

void	test_ft_read(int buffer_size)
{
	int fd;
	char str[buffer_size];
	
	if (buffer_size < 1)
		return ;
	fd = open("./test_files/test_read.txt", O_RDONLY);
	ft_read(fd, str, buffer_size);
	printf("ft_read: %s\n", str);
	close(fd);
	fd = open("./test_files/test_read.txt", O_RDONLY);
	read(fd, str, buffer_size);
	printf("   read: %s\n", str);
	close(fd);
}

void	test_ft_strdup(char *str)
{	
	printf("Ft_strdup: %s\n", ft_strdup(str));
	printf("   Strdup: %s\n", strdup(str));
}

void	ft_lstadd_back(t_list **lst, t_list *new)
{
	t_list	*temp;

	if (!(*lst))
		*lst = new;
	else
	{
		temp = *lst;
		while (temp->next)
			temp = temp->next;
		temp->next = new;
	}
}

void	test_ft_list_size(int size)
{
	t_list *list;
	t_list	*new;
	int i;
	char res[size + 1];

	if (size == 0)
		return ;
	i = 0;
	while (i < size)
	{
		res[i] = i + ' ';
		i++;
	}
	res[i] = '\0';
	i = 0;
	while (i < size)
	{
		new = (t_list *)malloc(sizeof(t_list));
		new->data = &res[i];
		new->next = NULL;
		ft_lstadd_back(&list, new);
		i++;
	}
	i = 0;
	printf ("Size list: %d\n\n", ft_list_size(list));
	while (i < size)
	{
		printf ("List: %d content: %c\n", i + 1, *((char *)list->data));
		i++;
		list = list->next;
	}
}

void	test_list_push_front(char *str)
{
	t_list *list;
	char *mystr = "Hello man!";
	char *mystr3 = "YEah i am 3 booooooy!";
	void *data;

	data = mystr3;
	ft_list_push_front(&list, data);
	data = mystr;
	ft_list_push_front(&list, data);
	data = str;
	ft_list_push_front(&list, data);
	printf("List 1: %s\nList 2: %s\nList 3: %s\n", (char *)list->data, (char *)list->next->data, (char *)list->next->next->data);
}

int		main(int ac, char **av)
{
	if (ac == 3)
	{
		if ((strcmp("ft_strlen", av[1]) == 0) || (strcmp("strlen", av[1]) == 0))
			test_ft_strlen(av[2]);
		else if ((strcmp("ft_strcpy", av[1]) == 0) || (strcmp("strcpy", av[1]) == 0))
			test_ft_strcpy(av[2]);
		else if ((strcmp("ft_read", av[1]) == 0) || (strcmp("read", av[1]) == 0))
			test_ft_read(atoi(av[2]));
		else if ((strcmp("ft_write", av[1]) == 0) || (strcmp("write", av[1]) == 0))
			test_ft_write(av[2]);
		else if ((strcmp("ft_strdup", av[1]) == 0) || (strcmp("strdup", av[1]) == 0))
			test_ft_strdup(av[2]);
		else if ((strcmp("ft_list_size", av[1]) == 0) || (strcmp("list_size", av[1]) == 0))
			test_ft_list_size(atoi(av[2]));
		else if ((strcmp("ft_list_push_front", av[1]) == 0) || (strcmp("list_push_front", av[1]) == 0))
			test_list_push_front(av[2]);
		else
			printf("./a.out [NAME FUNCTION] [ARGUMENTS]\n");
	}
	else if (ac == 4)
	{
		if ((strcmp("ft_strcmp", av[1]) == 0) || (strcmp("strcmp", av[1]) == 0))
			test_ft_strcmp(av[2], av[3]);
		else
			printf("./a.out [NAME FUNCTION] [ARGUMENTS]\n");
	}
	else
		printf("./a.out [NAME FUNCTION] [ARGUMENTS]\n");
	return (0);
}