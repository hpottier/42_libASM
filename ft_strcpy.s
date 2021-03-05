;******************************************************************************;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_strcpy.s                                        :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: hpottier <hpottier@student.42.fr>          +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2020/02/25 14:18:50 by hpottier          #+#    #+#              ;
;    Updated: 2020/02/27 12:39:48 by hpottier         ###   ########.fr        ;
;                                                                              ;
;******************************************************************************;

			global		ft_strcpy
			section		.text
ft_strcpy:
			xor			r8, r8
.loop:
			mov			r9b, byte [rsi + r8]
			mov			byte [rdi + r8], r9b
			cmp			byte [rsi + r8], 0
			je			.fin
			inc			r8
			jmp			.loop
.fin:
			mov			rax, rdi
			ret
