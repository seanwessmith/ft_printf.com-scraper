# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ssmith <marvin@42.fr>                      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2016/11/07 08:55:56 by ssmith            #+#    #+#              #
#    Updated: 2017/02/05 23:05:47 by ssmith           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME=libftprintf.a

CC=cc

C_FLAGS=-Wall -Wextra -Werror

SRC_DIR=./

OBJ_DIR=./build/

INC_DIR=./includes/

# Memory functions.
C_FILES =	ft_printf.c \

SOURCES=$(addprefix $(C_FILES))

INCLUDES=$(addprefix -I, $(INC_DIR))

OBJECTS=$(addprefix $(OBJ_DIR), $(patsubst %.c, %.o, $(C_FILES)))

default : all

test : $(NAME)
		$(MAKE) -C ./test/ re
		./test/test.out

all : $(NAME)

$(NAME) : $(OBJ_DIR) $(OBJECTS)
		@echo "Archiving object files..."
		@ar rc $(NAME) $(OBJECTS)
		@echo "Done."
		@echo "Indexing..."
		@ranlib $(NAME)
		@echo "Done."

$(OBJ_DIR) :
		@echo "Creating build directory..."
		@mkdir -p $(OBJ_DIR)
		@echo "Done."

$(OBJ_DIR)%.o : $(SRC_DIR)%.c
				$(CC) $(C_FLAGS) -c $< -o $@ $(INCLUDES)

fclean : clean
		@echo "Removing $(NAME)..."
		@rm -rf $(NAME)
		@echo "Done."

clean :
		@echo "Cleaning last build..."
		@rm -rf $(OBJ_DIR)
		@echo "Done."

re : fclean all

.PHONY : clean fclean re test
