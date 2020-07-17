section .text
    global _ft_strlen

_ft_strlen:
    xor rax, rax                  ; int i = 0
    cmp rdi, 0                  ; char *str == NULL
    je exit                     ; if (char *str == NULL) => return (NULL)
    jmp loop                    ; jump to loop

loop:
    cmp BYTE [rdi + rax], 0     ; if (*str == '\0')
    je exit                     ; if (!str) return (i)
    inc rax                     ; i++
    jmp loop                    ; jump to loop

exit:
    ret                         ; return (i)