section .text
        global _ft_list_size

; https://habr.com/ru/post/142662/
; list == 8 bit 

_ft_list_size:
        mov rsi, rdi            ; save pointer list
        xor rax, rax            ; rax = 0
        jmp loop                ; jump to loop

loop:
        cmp rdi, 0              ; if (list->next == NULL)
        je exit                 ; return (rax)
        inc rax                 ; rax++
        mov rdi, [rdi + 8]      ; list->next
        jmp loop                ; jump to loop

exit:
        mov rdi, rsi            ; return saved pointer
        ret                     ; return (rax)