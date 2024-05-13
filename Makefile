##
## EPITECH PROJECT, 2024
## B-ASM-400-PAR-4-1-asmminilibc-alexis.mer
## File description:
## Makefile
##

SRC	=	src/strlen.asm \
		src/strchr.asm \
		src/strrchr.asm \
		src/strcmp.asm \
		src/strncmp.asm \
		src/strcasecmp.asm \
		src/strstr.asm \
		src/strcspn.asm \
		src/strpbrk.asm \
		src/memset.asm \
		src/memcpy.asm \
		src/memmove.asm


OBJ	=	$(SRC:.asm=.o)

NAME	=	libasm.so

all:	$(NAME)

%.o:	%.asm
	nasm -f elf64 $< -o $@

$(NAME):	$(OBJ)
	ld $(OBJ) -o $(NAME) -shared -fPIC

clean:
	$(RM) $(OBJ)

fclean: clean
		$(RM) $(NAME)

re: fclean all

.PHONY: all clean fclean re