section .text
	global _ft_list_sort

; void	ft_list_sort(t_list **begin_list, int (*cmp)());
; rdi = **begin_list rsi = (*cmp)

_ft_list_sort:
    push r12            ; r12 => stack
    push r13            ; r13 => stack
    cmp rsi, 0          ; if (!(*cmp))
    je exit             ; return (exit)
    mov r11, [rdi]      ; move *begin_list => r11 registr
    cmp r11, 0          ; if (*begin_list == NULL)
    je exit             ; return (exit)
    mov r12, rsi        ; move (*cmp) => r12 registr
    mov r13, [r11 + 8]  ; move next list in r13 registr
    jmp loop            ; jump to loop

loop:
    cmp r13, 0          ; if (tmp == NULL)
    je inc_list         ; return (exit)
    mov rdi, [r11]      ; rdi = begin_list->data
    mov rsi, [r13]      ; rsi = tmp->data
    call r12            ; *cmp(rdi, rsi)
    cmp rax, 0          ; if (return > 0)
    jg swap_list        ; swap list
    jmp inc_tmp         ; jump to inc_tmp

inc_list:
    mov r11, [r11 + 8]  ; begin_list = begin_list->next
    cmp r11, 0          ; if (begin_list == 0)
    je exit             ; return (exit)
    mov r13, [r11 + 8]  ; tmp = tmp->next
    jmp loop            ; jump to loop

; swap list r11 r13 with temp r8 and r9
swap_list:
    mov r8, [r11]
    mov r9, [r13]
    mov [r11], r9
    mov [r13], r8
    jmp inc_tmp

inc_tmp:
    mov r13, [r13 + 8]  ; tmp = tmp->next
    jmp loop            ; jump to loop
    
exit:
    pop r13             ; r13 <= stack
    pop r12             ; r12 <= stack
    ret                 ; return (exit)