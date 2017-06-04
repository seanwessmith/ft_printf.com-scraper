# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tchan <tchan@student.42.us.org>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2017/05/15 21:10:43 by tchan             #+#    #+#              #
#    Updated: 2017/05/15 21:10:44 by tchan            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = libftprintf.a

CC = gcc
CFLAGS = -Wall -Wextra -Werror
AR = ar
INC = -I ./include

FILES = ft_printf.c

OBJ = $(addprefix build/, $(FILES:.c=.o))
SRC = $(FILES)

.PHONY: all clean fclean re test

all: $(NAME)

$(NAME): $(OBJ)
    $(AR) crs $@ $^
    echo "Creating $(NAME)"

build/%.o: src/%.c | build
    @echo "Doing things to $@"
    @$(CC) $(CFLAGS) $(INC) -c $< -o $@

build:
    mkdir build

clean:
    @rm -rf build
    @echo "clean successful"

fclean: clean
    @echo "Removing $(NAME)"
    rm -f $(NAME)

test:
    make re
    $(CC) $(NAME) $(MAIN) $(INC)
    ./a.out

re: fclean all