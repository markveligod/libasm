# ifndef LIBASM_H
# define LIBASM_H

#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>
#include <fcntl.h>
#include <string.h>

typedef struct	s_list
{
				void *data;
				struct s_list *next;
}				t_list;

/*
** prototype base
*/

int				ft_strlen(char *str);
char			*ft_strcpy(char *dst, const char *src);
int				ft_strcmp(const char *s1, const char *s2);
ssize_t			ft_write(int fildes, const void *buf, size_t nbyte);
ssize_t			ft_read(int fildes, void *buf, size_t nbyte);
char			*ft_strdup(const char *s);

/*
** prototype bonus
*/

int				ft_list_size(t_list *list);
void			ft_list_push_front(t_list **begin_list, void *data);
int				ft_atoi_base(char const *str, char const *base);

# endif