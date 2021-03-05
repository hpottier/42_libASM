;******************************************************************************;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_atoi_base.s                                     :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: hpottier <hpottier@student.42.fr>          +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2020/02/25 19:33:16 by hpottier          #+#    #+#              ;
;    Updated: 2020/03/08 00:20:37 by hpottier         ###   ########.fr        ;
;                                                                              ;
;******************************************************************************;

			global		ft_atoi_base
			section		.text
ft_atoi_base:
			test		rdi, rdi
			je			.err
			mov			r8, -1
.checkbase:
			inc			r8
			cmp			byte [rsi + r8], "+"
			je			.err
			cmp			byte [rsi + r8], "-"
			je			.err
			cmp			byte [rsi + r8], `\t`
			je			.err
			cmp			byte [rsi + r8], `\n`
			je			.err
			cmp			byte [rsi + r8], `\r`
			je			.err
			cmp			byte [rsi + r8], `\v`
			je			.err
			cmp			byte [rsi + r8], `\f`
			je			.err
			cmp			byte [rsi + r8], ` `
			je			.err
			mov			r9, -1					; Check doublons
			mov			r11b, byte [rsi + r8]	; ...
.chkexists:	inc			r9						; Boucle
			cmp			r8, r9					; Si egal on check pas
			je			.dontchk				; ...
			cmp			byte [rsi + r9], r11b	; Check si douuble
			je			.err					; ...
.dontchk:	cmp			byte [rsi + r9], 0		; Pas de doublon on continue
			je			.cont					; ...
			jmp			.chkexists				; ...
.cont:		cmp			byte [rsi + r8], 0
			jne			.checkbase
			dec			rdi
.ignore_spaces:
			inc			rdi
			cmp			byte [rdi], `\t`
			je			.ignore_spaces
			cmp			byte [rdi], `\n`
			je			.ignore_spaces
			cmp			byte [rdi], `\r`
			je			.ignore_spaces
			cmp			byte [rdi], `\v`
			je			.ignore_spaces
			cmp			byte [rdi], `\f`
			je			.ignore_spaces
			cmp			byte [rdi], ` `
			je			.ignore_spaces
			dec			rdi
			xor			r10, r10
.neg_pos:
			inc			r10						; Si pos r10 = 1 sinon r10 = 0
.neg_pos2:	inc			rdi
			cmp			byte [rdi], "-"
			je			.neg_pos
			cmp			byte [rdi], "+"
			je			.neg_pos2
			and			r10, 1					; r10 = r10 % 2
			xor			rax, rax
.atoi_base:
			cmp			byte [rdi], 0
			je			.fin
			mov			r9, -1					; Check si chiffre dans base
			mov			r11b, byte [rdi]		; ...
.schbase:	inc			r9						; Boucle
			cmp			byte [rsi + r9], r11b	; ...
			je			.calcul					; ...
			cmp			byte [rsi + r9], 0		; Si pas dans base c'est fini
			je			.fin					; ...
			jmp			.schbase				; ...
.calcul:
			imul		rax, r8					; Calcul en lui-meme
			add			rax, r9					; ...
			inc			rdi
			jmp			.atoi_base
.fin:
			cmp			r10, 0
			je			.neg
			ret
.neg:
			neg			rax
			ret
.err:
			xor			rax, rax
			ret
