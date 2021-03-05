;******************************************************************************;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_strdup.s                                        :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: hpottier <hpottier@student.42.fr>          +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2020/02/25 17:51:30 by hpottier          #+#    #+#              ;
;    Updated: 2020/03/08 00:31:20 by hpottier         ###   ########.fr        ;
;                                                                              ;
;******************************************************************************;

			global		ft_strdup
			extern		malloc
			extern		ft_strlen
			extern		ft_strcpy
			section		.text
ft_strdup:
			sub			rsp, 8		; Align rsp
			call		ft_strlen	; Get len
			inc			rax			; Add 1 for \0
			mov			r15, rdi	; Save rdi
			mov			rdi, rax	; Call malloc with the size
			call		malloc		; ...
			mov			rsi, r15	; Makes copy with ft_strcpy
			mov			rdi, rax	; ...
			call		ft_strcpy	; ...
			add			rsp, 8		; Realign rsp
			ret
