;******************************************************************************;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_list_size.s                                     :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: hpottier <hpottier@student.42.fr>          +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2020/03/03 23:47:32 by hpottier          #+#    #+#              ;
;    Updated: 2020/03/04 02:17:47 by hpottier         ###   ########.fr        ;
;                                                                              ;
;******************************************************************************;

			global		ft_list_size
			section		.text
ft_list_size:
			xor			rax, rax
.loop:
			cmp			rdi, 0
			je			.fin
			inc			rax
			mov			rdi, qword [rdi + 8]
			jmp			.loop
.fin:		ret
