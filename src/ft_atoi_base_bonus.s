section .text
	extern _ft_strlen
	global _ft_atoi_base

;	int		ft_atoi_base(char const *str, char const *base);
;	rdi = *str	rsi = *base

_ft_atoi_base:
    push r12        ; r12 =>stack
    push r13        ; r13 => stack
    push r14        ; r14 => stack
    cmp rdi, 0      ; rdi == NULL
    je exit         ; return (exit)
    cmp rsi, 0      ; rsi == NULL
    je exit         ; return (exit)
    mov r10, rdi	; save *str in r10
	mov r11, rsi	; save *base in r11
	mov rdi, rsi
    call _ft_strlen
    mov r12, rax    ; return size base
    cmp r12, 0      ; if (strlen(base) == 0)
    je exit         ; return (exit)
    cmp r12, 1      ; if (strlen(base) == 1)
    je exit         ; return (exit)
    push r11        ; r11 => stack
    call base       ; call base


exit:
    mov rax, r14
	imul rax, r13
	pop r14
	pop r13
	pop r12
	ret