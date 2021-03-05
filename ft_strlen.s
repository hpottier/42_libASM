;******************************************************************************;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_strlen.s                                        :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: hpottier <hpottier@student.42.fr>          +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2020/02/23 11:30:18 by hpottier          #+#    #+#              ;
;    Updated: 2020/02/27 16:28:56 by hpottier         ###   ########.fr        ;
;                                                                              ;
;******************************************************************************;

			global		ft_strlen
			section		.text
ft_strlen:
			xor			rax, rax
.loop:
			cmp			byte [rdi + rax], 0
			je			.fin
			inc			rax
			jmp			.loop
.fin:		ret
