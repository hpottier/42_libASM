;******************************************************************************;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_list_sort.s                                     :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: hpottier <hpottier@student.42.fr>          +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2020/03/04 02:18:59 by hpottier          #+#    #+#              ;
;    Updated: 2020/03/08 00:23:31 by hpottier         ###   ########.fr        ;
;                                                                              ;
;******************************************************************************;

			global		ft_list_sort
			global		sorted_merge
			section		.text
ft_list_sort:
			test		rdi, rdi				; If list == NULL
			je			.err					; Exit
			test		rsi, rsi				; If cmp == NULL
			je			.err					; Exit
			push		r12						; Save registers
			push		rbp						; ...
			sub			rsp, 24					; Needed for *a and *b
			mov			rbp, rdi				; rbp is list
			mov			r12, qword [rdi]		; r12 is *list so slow
			test		r12, r12				; If *list == NULL
			je			.fin					; return
			mov			rax, qword [r12 + 8]	; rax is (*list)->next so fast
			test		rax, rax				; If (*list)->next == NULL
			je			.fin					; return
			mov			qword [rsp], r12		; [rsp + 0] is *a
.splitloop:
			mov			rax, qword [rax + 8]	; fast = fast->next
			test		rax, rax				; If fast != NULL
			je			.recursion				; Increment again
			mov			rax, qword [rax + 8]	; fast = fast->next
			mov			r12, qword [r12 + 8]	; slow = slow->next
			test		rax, rax				; If fast != NULL
			jne			.splitloop				; Loop
.recursion:
			mov			r10, qword [r12 + 8]	; b = slow->next
			mov			qword [rsp + 8], r10	; ...
			mov			qword [r12 + 8], 0		; slow->next = NULL
			mov			rdi, rsp				; Start recursion with *a
			call		ft_list_sort			; ...
			lea			rdi, [rsp + 8]			; Start recursion with *b
			call		ft_list_sort			; ...
			mov			rdi, qword [rsp]		; Call sorted_merge(a, cmp, b)
			mov			rdx, qword [rsp + 8]	; ...
			call		sorted_merge			; ...
			mov			qword [rbp], rax		; *list = rax
.fin:
			add			rsp, 24					; Realign rsp
			pop			rbp						; Get old register values
			pop			r12						; ...
			ret
.err:
			ret

sorted_merge:
			push		r15						; Save old values
			push		r14						; ...
			push		rbx						; ...
			mov			r14, rdx				; r14 = b
			test		rdi, rdi				; If a == NULL
			je			.setrax					; Ret b
			mov			rbx, rdi				; rbx = a
			test		r14, r14				; If b == NULL
			je			.reta					; Ret a
			mov			r15, rsi				; r15 = cmp
			mov			rdi, qword [rbx]		; Call (*cmp)
			mov			rsi, qword [r14]		; (a->data, b->data)
			xor			eax, eax				; Puts rax to 0
			call		r15						; The call itself
			test		eax, eax				; If the result is negative
			js			.anext					; a < b
			mov			rdx, qword [r14 + 8]	; Start recursion
			mov			rdi, rbx				; (a, cmp, b->next)
			mov			rsi, r15				; ...
			call		sorted_merge			; The call
			mov			qword [r14 + 8], rax	; b->next = rax
			jmp			.setrax					; We can now return result
.reta:
			mov			r14, rbx				; r14 = a
.setrax:
			mov			rax, r14				; a or b in rax
.finsm:
			pop			rbx						; Get back old values
			pop			r14						; ...
			pop			r15						; ...
			ret
.anext:
			mov			rdi, qword [rbx + 8]	; Start recursion
			mov			rsi, r15				; (a->next, cmp, b)
			mov			rdx, r14				; ...
			call		sorted_merge			; The call
			mov			qword [rbx + 8], rax	; a->next= rax
			mov			rax, rbx				; a in rax
			jmp			.finsm					; We can now return a
