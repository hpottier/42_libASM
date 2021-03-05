;******************************************************************************;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_create_elem.s                                   :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: hpottier <hpottier@student.42.fr>          +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2020/03/04 01:31:56 by hpottier          #+#    #+#              ;
;    Updated: 2020/03/04 20:51:46 by hpottier         ###   ########.fr        ;
;                                                                              ;
;******************************************************************************;

			global		ft_create_elem
			extern		malloc
			section		.text
ft_create_elem:
			push		rdi
			mov			rdi, 16
			call		malloc
			pop			rdi
			cmp			rax, 0
			je			.fin
			mov			qword [rax], rdi
			mov			qword [rax + 8], 0
.fin:		ret
