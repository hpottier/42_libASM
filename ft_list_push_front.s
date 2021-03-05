;******************************************************************************;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_list_push_front.s                               :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: hpottier <hpottier@student.42.fr>          +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2020/03/04 01:29:32 by hpottier          #+#    #+#              ;
;    Updated: 2020/03/04 02:08:37 by hpottier         ###   ########.fr        ;
;                                                                              ;
;******************************************************************************;

			global		ft_list_push_front
			extern		ft_create_elem
			section		.text
ft_list_push_front:
			push		rdi
			mov			rdi, rsi
			call		ft_create_elem
			pop			rdi
			mov			rsi, [rdi]
			mov			qword [rax + 8], rsi
			mov			[rdi], rax
			ret
