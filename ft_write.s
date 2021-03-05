;******************************************************************************;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_write.s                                         :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: hpottier <hpottier@student.42.fr>          +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2020/02/24 21:06:58 by hpottier          #+#    #+#              ;
;    Updated: 2020/03/03 21:15:43 by hpottier         ###   ########.fr        ;
;                                                                              ;
;******************************************************************************;

			global		ft_write
			extern		__errno_location
			section		.text
ft_write:
			mov			rax, 0x0000001
			syscall
			cmp			rax, 0
			jl			.err
			ret
.err:
			push		rax
			call		__errno_location
			pop			r8
			neg			r8
			mov			[rax], r8
			mov			rax, -1
			ret
