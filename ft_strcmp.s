;******************************************************************************;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_strcmp.s                                        :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: hpottier <hpottier@student.42.fr>          +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2020/02/25 15:04:10 by hpottier          #+#    #+#              ;
;    Updated: 2020/03/06 03:45:00 by hpottier         ###   ########.fr        ;
;                                                                              ;
;******************************************************************************;

			global		ft_strcmp
			section		.text
ft_strcmp:
			mov			r8, -1
.loop:
			inc			r8
			mov			r9b, byte [rdi + r8]
			cmp			r9b, byte [rsi + r8]
			jg			.pos
			jl			.neg
			cmp			byte [rdi + r8], 0
			je			.ega
			cmp			byte [rsi + r8], 0
			je			.ega
			jmp			.loop
.ega:
			xor			rax, rax
			ret
.pos:
			mov			rax, 1
			ret
.neg:
			mov			rax, -1
			ret
