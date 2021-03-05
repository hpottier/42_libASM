;******************************************************************************;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_isspace.s                                       :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: hpottier <hpottier@student.42.fr>          +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2020/02/27 11:13:03 by hpottier          #+#    #+#              ;
;    Updated: 2020/02/27 12:39:15 by hpottier         ###   ########.fr        ;
;                                                                              ;
;******************************************************************************;

			global		ft_isspace
			section		.text
ft_isspace:
			cmp			byte [rdi], `\t`
			je			.oui
			cmp			byte [rdi], `\n`
			je			.oui
			cmp			byte [rdi], `\r`
			je			.oui
			cmp			byte [rdi], `\v`
			je			.oui
			cmp			byte [rdi], `\f`
			je			.oui
			cmp			byte [rdi], ` `
			je			.oui
			xor			rax, rax
			ret
.oui:
			mov			rax, 1
			ret
