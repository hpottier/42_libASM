# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: hpottier <hpottier@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2019/12/02 17:06:12 by hpottier          #+#    #+#              #
#    Updated: 2021/03/05 13:12:20 by hpottier         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME		=	libasm.a

ODIR		=	./objects

SRC			=	ft_strcmp.s \
				ft_strlen.s \
				ft_strcpy.s \
				ft_strdup.s \
				ft_write.s \
				ft_read.s \
				ft_isdigit.s \
				ft_isspace.s \
				ft_atoi_base.s \
				ft_isdigit.s \
				ft_isspace.s \
				ft_create_elem.s \
				ft_list_push_front.s \
				ft_list_size.s \
				ft_list_remove_if.s \
				ft_list_sort.s

OBJ			=	$(SRC:.s=.o)
OBJS		=	$(OBJ:%=$(ODIR)/%)

NAFL		=	-felf64

NA			=	nasm
AC			=	ar rc
RANLIB		=	ranlib
RM			=	rm -f
ECHO		=	echo

$(NAME)		:	$(OBJS)
					@$(ECHO) "\033[38;5;208m> Building libASM\033[38;5;125m"
					$(AC) $(NAME) $(OBJS)
					$(RANLIB) $(NAME)
					@$(ECHO) "\033[32m> libASM compiled\033[0m"

$(OBJS)		:	|	$(ODIR)

$(ODIR)		:
					@mkdir $(ODIR)

clean		:
					-@$(RM) -r $(ODIR)
					@$(ECHO) "\033[94m> libASM objects removed\033[0m"

all			:	$(NAME)

fclean		:	clean
					-@$(RM) $(NAME)
					@$(ECHO) "\033[94m> libASM cleaned all\033[0m"

re			:	fclean all

.PHONY		:	all clean re fclean

$(ODIR)/%.o	:	%.s
					@$(ECHO) "\033[38;5;208m> Compiling libASM\033[38;5;125m"
					$(NA) $(NAFL) -o $@ $<
