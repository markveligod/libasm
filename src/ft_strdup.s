section .text
        global _ft_strdup
        extern _malloc
        extern _ft_strlen
        extern _ft_strcpy

; ft_strdup(const char *str)
; str = rdi

_ft_strdup:
    xor rax, rax        ; rax = 0
    cmp rdi, 0          ; if (*str == NULL)
    je exit             ; return (exit)
    push rdi            ; rdi => stack
    call _ft_strlen     ; return size in rax
    mov rdi, rax        ; rax in rdi
    inc rdi             ; rdi++
    call _malloc        ; allocate rax
    cmp rax, 0          ; if (rax == NULL)
    je error            ; return (error)
    pop rsi             ; rsi <= stack
    mov rdi, rax        ; move allocate rax to rdi
    call _ft_strcpy     ; copy rsi to rdi return rax
    jmp exit            ; jump to exit

error:
    xor rax, rax        ; rax = 0
    mov rax, -1         ; call error => -1
    ret                 ; return (rax)

exit:
    ret                 ; return (rax)