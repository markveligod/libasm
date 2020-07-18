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
    pop r11         ; r11 <= stack
    cmp rax, 0      ; if (rax == 0)
    je exit         ; return (exit)
    mov r13, 1      ; negative
    xor r14, r14    ; clear r14 registr
    jmp skip        ; jump to skip

; func which check base content
; check base len <= 1 or same char 2 times and base with whitespace + or -
base:
    mov bl, [r11]   ; ch == *base
    cmp bl, 0       ; if (*base == \0)
    je base_ok      ; return (1)
    cmp bl, 32      ; if (*base == ' ')
    je base_fail    ; return (0)
    cmp bl, 43      ; if (*base == '+')
    je base_fail    ; return (0)
    cmp bl, 45      ; if (*base == '-')
    je base_fail    ; return (0)
    push r11        ; save registr base on stack
    inc r11         ; next char from base
    xor r9, r9      ; clear r9 registr
    call is_base    ; check char in str
    pop r11         ; r11 <= stack
    cmp rax, -1     ; if (is_base == -1)
    jne base_fail   ; return (0)
    inc r11         ; *base++
    jmp base        ; jump to base (loop)

base_ok:
    mov rax, 1
    ret

base_fail:
    mov rax, 0
    ret

; We check if the char is not already in the base
is_base:
    cmp bl, [r11]
    je is_base_ok
    mov cl, [r11]
    cmp cl, 0
    je is_base_fail
    inc r9
    inc r11
    jmp is_base

is_base_ok:
    mov rax, r9
    ret

is_base_fail:
    mov rax, -1
    ret

skip:
    mov bl, [r10]       ; *str
    cmp bl, 9           ; \t
    je inc_skip         ; *str++
    cmp bl, 10          ; \n
    je inc_skip         ; *str++
    cmp bl, 11          ; \v
    je inc_skip         ; *str++
    cmp bl, 12          ; \f
    je inc_skip         ; *str++
    cmp bl, 13          ; \r
    je inc_skip         ; *str++
    cmp bl, 32          ; ' '
    je inc_skip         ; *str++
    jmp sign            ; jump to sign

inc_skip:
    inc r10             ; *str++
    jmp skip            ; jump to skip

; check + and - on str
sign:
    mov bl, [r10]       ; check on + or -
    cmp bl, 43          ; if (*str == '+')
    je inc_sign         ; *str++
    cmp bl, 45          ; if (*str == '-')
    je minus            ; rax * (-1)
    mov r13, rax        ; result move in r13 registr
    jmp convert         ; jump to convert

inc_skip:
    inc r10             ; *str++
    jmp sign            ; jump to sign

minus:
    inc r10
    imul rax, -1
    jmp sign

; conver char to int
convert:
    mov bl, [r10]       ; *str
    cmp bl, 0           ; if (*str == NULL)
    je exit             ; return (exit)
    xor r9, r9          ; clear r9 registr
    push r11            ; r11 => stack
    call is_base        ; return rax is base index
    pop r11             ; r11 <= stack
    cmp rax, -1         ; if (rax == -1)
    je exit             ; return (exit)
    imul r14, r12       ; r14 * r12 base len
    add r14, rax        ; add base index
    inc r10             ; *str++
    jmp convert         ; jump to convert

exit:
    mov rax, r14        ; move from r14 to rax
	imul rax, r13       ; move from r13 to rax
	pop r14             ; r14 <= stack
	pop r13             ; r13 <= stack
	pop r12             ; r12 <= stack
	ret                 ; return rax