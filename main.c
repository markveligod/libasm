#include "libasm.h"

void	test_ft_strlen(char *str)
{
	printf("Strlen: %-20d\n", strlen(str));
	printf("Ft_strlen: %-20d\n", ft_strlen(str));
}

int		main(int ac, char **av)
{
	if (ac == 3)
	{
		if ((strcmp("ft_strlen", av[1]) == 0))
			test_ft_strlen(av[2]);
		else
			printf("./a.out [NAME FUNCTION] [ARGUMENT]\n");
	}
	else
		printf("./a.out [NAME FUNCTION] [ARGUMENT]\n");
	return (0);
}