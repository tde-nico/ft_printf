# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tde-nico <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/01/13 11:25:43 by tde-nico          #+#    #+#              #
#    Updated: 2022/01/26 08:55:07 by tde-nico         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

CC = cc
CFLAGS += -Wall -Wextra -Werror -Iinclude
AR = ar

NAME = libftprintf.a

HEADER = ft_printf.h

SRC		 =	 ft_printf.c \
			 utils.c \
			 parse_flags.c \
			 process_types_1.c \
			 process_types_2.c \
			 ft_putunbr_base.c

OBJS = $(SRC:.c=.o)
OBJS_LIBFT = $(SRC_LIBFT:.c=.o)

all: $(NAME)

$(NAME): libft $(OBJS) $(HEADER)
	cp libft/libft.a $(NAME)
	$(AR) -rcs $(NAME) $(OBJS)

libft:
	make -C ./libft

.o: .c
	$(CC) $(CFLAGS) -c $< -o $@

bonus: all

clean:
	rm -f $(OBJS)

fclean: clean
	rm -rf $(NAME) test test.dSYM
	make -C libft fclean

re: fclean all

.PHONY: all clean fclean re bonus debug libft
