;******************************************************************************;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_list_remove_if.s                                :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: hpottier <hpottier@student.42.fr>          +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2020/03/04 02:51:38 by hpottier          #+#    #+#              ;
;    Updated: 2020/03/06 03:49:32 by hpottier         ###   ########.fr        ;
;                                                                              ;
;******************************************************************************;

			global		ft_list_remove_if
			extern		free
			section		.text
ft_list_remove_if:
			test		rdi, rdi			; Check if list == NULL
			je			.err				; If true, exit
			test		rdx, rdx			; Check if cmp == NULL
			je			.err				; If true, exit
			test		rcx, rcx			; Check if libre == NULL
			je			.err				; If true, exit
			push		r15					; Save registers
			push		r14					; ...
			push		r13					; ...
			push		r12					; ...
			push		rbp					; ...
			push		rbx					; ...
			sub			rsp, 8				; Align stack pointer
			mov			rbp, qword [rdi]	; cur = *list
			test		rbp, rbp			; Check if cur == 0
			je			.fin				; If true the list is empty
			mov			r15, rdi			; r15 is list
			mov			r14, rsi			; r14 is data_ref
			mov			r13, rdx			; r13 is (*cmp)()
			mov			r12, rcx			; r12 is (*libre)()
			xor			ebx, ebx			; tmp = 0
			jmp			.boucle				; Start loop
.eraselem:
			mov			rdi, qword [rbp]	; Free data
			call		r12					; ...
			mov			rax, qword [rbp+8]	; Save cur->next in rax
			test		rbx, rbx			; Check if tmp == 0
			je			.firstelem			; If so update list pointer
			mov			qword [rbx+8], rax	; Else, tmp->next = cur->next
			mov			rdi, rbp			; Free cur
			call		free				; ...
			mov			rbp, qword [rbx+8]	; cur = tmp->next
.loopcond:
			test		rbp, rbp			; If cur == 0
			je			.fin				; The end
.boucle:
			mov			rdi, qword [rbp]	; Call compare function
			mov			rsi, r14			; rdi = cur->data, rsi = data_ref
			call		r13					; ...
			test		eax, eax			; If 0 erase
			je			.eraselem			; Else continue looping
			mov			rbx, rbp			; tmp = cur
			mov			rbp, qword [rbp+8]	; cur = cur->next
			test		rbp, rbp			; If cur != 0 continue looping
			jne			.boucle				; ...
.fin:
			add			rsp, 8				; Realign stack pointer
			pop			rbx					; Get old register values
			pop			rbp					; ...
			pop			r12					; ...
			pop			r13					; ...
			pop			r14					; ...
			pop			r15					; ...
			ret								; return
.firstelem:
			mov			qword [r15], rax	; *list = cur->next
			mov			rdi, rbp			; Free cur
			call		free				; ...
			mov			rbp, qword [r15]	; cur = *list
			jmp			.loopcond			; Go back to loop
.err:
			ret								; return
