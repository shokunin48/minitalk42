# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ibellash <ibellash@student.42wolfsburg.    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/03/16 18:41:44 by ibellash          #+#    #+#              #
#    Updated: 2023/03/24 10:36:18 by ibellash         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

CLIENT_SRCS = client.c
SERVER_SRCS = server.c

PRINT_F = ft_printf
PRINT = libftprintf.a
LIB_FT = libft
LIB = libft.a 

CC = gcc
CFLAGS = -Wall -Wextra -Werror

CLIENT_NAME = client
NAME = server

SERVER_OBJS = $(SERVER_SRCS: .c=.o)
CLIENT_OBJS = $(CLIENT_SRCS: .c=.o) 

all: $(NAME) $(CLIENT_NAME)

$(NAME): $(SERVER_OBJS) $(PRINT_F)/$(PRINT) $(LIB_FT)/$(LIB)
	@$(CC) $(CFLAGS) $(LIB_FT)/$(LIB) $(PRINT_F)/$(PRINT) $(SERVER_OBJS) -o $(NAME)

$(CLIENT_NAME): $(CLIENT_OBJS)
	@$(CC) $(CFLAGS) $(CLIENT_OBJS) $(LIB_FT)/$(LIB) $(PRINT_F)/$(PRINT) -o $(CLIENT_NAME)

$(LIB_FT)/$(LIB):
	@make -C $(LIB_FT)
$(PRINT_F)/$(PRINT):
	@make -C $(PRINT_F)

clean:
	@rm -rf *.o
	@make -C $(LIB_FT) clean
	@make -C $(PRINT_F) clean

fclean: clean
	@rm -rf $(NAME) $(CLIENT_NAME)
	@make -C $(LIB_FT) fclean
	@make -C $(PRINT_F) fclean
	
re: fclean all

.PHONY: all clean fclean re
