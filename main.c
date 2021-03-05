/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: hpottier <hpottier@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2020/02/24 19:27:24 by hpottier          #+#    #+#             */
/*   Updated: 2021/03/05 13:40:38 by hpottier         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <stdio.h>
#include <unistd.h>
#include <errno.h>
#include <stdlib.h>
#include <string.h>

typedef struct	s_list
{
	char			*data;
	struct s_list	*next;
}				t_list;

ssize_t			ft_write(int fd, const void *buf, size_t size);
ssize_t			ft_read(int fd, void *buf, size_t size);
size_t			ft_strlen(char *str);
char			*ft_strcpy(char *s1, const char *s2);
int				ft_strcmp(const char *s1, const char *s2);
char			*ft_strdup(const char *str);

t_list			*ft_create_elem(void *data);

int				ft_atoi_base(char *nbr, char *base);
int				ft_list_size(t_list *lst);
void			ft_list_push_front(t_list **lst, void *data);
void			ft_list_remove_if(t_list **lst, void *data_ref,
							int (*cmp)(), void (*freedata)(void *));
void			ft_list_sort(t_list **lst, int (*cmp)());

void			libre(void *elem)
{
	free(elem);
}

void			printlst(t_list *elem)
{
	while (elem != NULL)
	{
		printf("elem = |%p| data = |%s| next = |%p|\n", elem,
			(char *)elem->data, elem->next);
		elem = elem->next;
	}
}

int				main(void)
{
	t_list	**lst;
	char	buf[501];

	printf("Write a number in hexa to convert (use lowercase), 500 characters max.\n");
	ft_read(1, buf, 500);
	buf[500] = 0;
	printf("Number is %d\n\n", ft_atoi_base(buf, "0123456789abcdef"));
	lst = (t_list **)malloc(sizeof(t_list *));
	*lst = NULL;
	ft_list_push_front(lst, ft_strdup("CCCCCCC"));
	ft_list_push_front(lst, ft_strdup("ZZZZZZZ"));
	ft_list_push_front(lst, ft_strdup("AAAAAAA"));
	ft_list_push_front(lst, ft_strdup("ZZZZZZZ"));
	ft_list_push_front(lst, ft_strdup("BBBBBBB"));
	printf("List size = %d\n", ft_list_size(*lst));
	printlst(*lst);
	ft_list_remove_if(lst, "ZZZZZZZ", &ft_strcmp, &libre);
	ft_list_sort(lst, &ft_strcmp);
	ft_write(1, "\n", 1);
	printf("List size = %d\n", ft_list_size(*lst));
	printlst(*lst);
	printf("Test errno ft_write: %zd, %s\nPress enter\n", ft_write(-12, " ", 1), strerror(errno));
	printf("Test errno ft_read: %zd, %s\n", ft_read(1, NULL, 1), strerror(errno));
	return (0);
}
