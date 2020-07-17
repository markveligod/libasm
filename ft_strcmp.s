section .text
    global _ft_strcmp

_ft_strcmp:
    xor rax, rax            ; char c = NULL
    xor rbx, rbx            ; char h = NULL
    jmp loop                ; jump to loop

loop:
    mov al, BYTE [rdi]      ; c = *dest
    mov bl, BYTE [rsi]      ; h = *src
    cmp al, 0               ; if (c == \0)
    je exit                 ; return ()
    cmp bl, 0               ; if (h == \0)
    je exit                 ; return ()
    cmp al, bl              ; if (c != h)
    jne exit                ; reutrn ()
    inc rdi                 ; *dest++
    inc rsi                 ; *src
    jmp loop                ; jump to loop

exit:
    movzx rax, al           ; move from low registr (al) to 64-x registr (rax) with 0 byte
    movzx rbx, bl           ; move from low registr (bl) to 64-x registr (rbx) with 0 byte
    sub rax, rbx            ; temp = (c - h)
    ret                     ; return (temp)