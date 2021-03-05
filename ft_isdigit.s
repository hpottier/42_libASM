;******************************************************************************;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_isdigit.s                                       :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: hpottier <hpottier@student.42.fr>          +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2020/02/25 19:48:33 by hpottier          #+#    #+#              ;
;    Updated: 2020/02/27 12:39:26 by hpottier         ###   ########.fr        ;
;                                                                              ;
;******************************************************************************;

			global		ft_isdigit
			section		.text
ft_isdigit:
			cmp			rdi, "0"
			jb			.non
			cmp			rdi, "9"
			ja			.non
			mov			rax, 1
			ret
.non:
			xor			rax, rax
			ret
