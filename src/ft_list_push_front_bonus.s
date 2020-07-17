section .text
    global _ft_list_push_front
    extern _malloc

; rdi = t_list **list, rsi = void *data

_ft_list_push_front:
    push rsp                ; align stack
    push rdi                ; rdi => stack
    push rsi                ; rsi => stack
    mov rdi, 16             ; 16 bit for void *data and *next
    call _malloc            ; allocate rax
    pop rsi                 ; rsi <= stack
    pop rdi                 ; rdi <= stack
    cmp rax, 0              ; if (malloc(sizeof(t_list)) == NULL)
    je error                ; return (error)
    mov [rax], rsi          ; lst->data = data
    mov rcx, [rdi]
    mov [rax + 8], rcx      ; lst->next = *list
    mov [rdi], rax          ; *list = lst

error:
    pop rsp             ; align stack
    ret                 ; return (rax)