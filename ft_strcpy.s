section .text
    global _ft_strcpy

_ft_strcpy:
    mov rax, 0              ; char temp
    push rdi                ; rdi = dst
    jmp loop                ; jump to loop

loop:
    cmp BYTE [rsi], 0       ; rsi = src if (src != \0)
    je exit                 ; if (src == \0) return dst
    mov rax, [rsi]          ; temp = src[0]
    mov [rdi], rax          ; dst[0] = temp
    inc rdi                 ; *dst++
    inc rsi                 ; *src++
    jmp loop                ; jump to loop

exit:
    mov BYTE [rdi], 0       ; add \0
    pop rax
    ret