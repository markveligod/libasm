FLAGS = -Wall -Wextra -Werror
SRC = ft_strlen.s
NAME = libasm.a
OBJ = $(SRC:%.s=%.o)

%.o: %.s
	nasm -f macho64 -g $< -o $@
	@echo "\033[90m[\033[32mOK\033[90m]\033[33m Compiling $<\033[0m"

all: $(NAME)

$(NAME) : $(OBJ)
	ar rcs $(NAME) $(OBJ)
	@echo "\033[90m[\033[32mSuccess\033[90m]\033[32m Successfully compiled libasm.a .\033[0m"

test: all
	$(CC) main.c $(NAME) $(FLAGS)
	@echo "\033[90m[\033[32mSuccess\033[90m]\033[32m Successfully compiled test's .\033[0m"

clean:
	$(RM) $(OBJ)
	@echo "\033[90m[\033[91mDeleting\033[90m]\033[31m Object files deleted\033[0m"

fclean: clean
	$(RM) $(NAME) a.out
	@echo "\033[90m[\033[91mDeleting\033[90m]\033[31m libasm.a deleted.\033[0m"
	@echo "\033[90m[\033[91mDeleting\033[90m]\033[31m test deleted.\033[0m"

re: fclean all test

.PHONY: all test clean fclean re