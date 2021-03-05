;******************************************************************************;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_read.s                                          :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: hpottier <hpottier@student.42.fr>          +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2020/02/25 18:35:58 by hpottier          #+#    #+#              ;
;    Updated: 2020/02/25 19:20:15 by hpottier         ###   ########.fr        ;
;                                                                              ;
;******************************************************************************;

			global		ft_read
			extern		__errno_location
			section		.text
ft_read:
			mov			rax, 0x0000000
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
