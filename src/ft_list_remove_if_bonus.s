section .text
    extern _free
    global _ft_list_remove_if

; void ft_list_remove_if(t_list **begin_list, void *data_ref, int (*cmp)());
; rdi = **begin_list, rsi = *data_ref, rdx = (*cmp) 

_ft_list_remove_if:
    cmp rdi, 0		        ; if **begin_list == NULL
    je exit		            ; return (exit)
    cmp rsi, 0              ; if data_ref == NULL
    je exit                 ; return (exit)
    jmp start               ; jump to start
    
start:
    mov r10, [rdi]	        ; r10 = *begin_list
    cmp r10, 0              ; if *begin_list == NULL
    je stop                 ; return (stop)
    push rdi                ; rdi => stack
    push rsi			    ; rsi => stack
    push rdx			    ; rdx => stack
    mov rdi, [r10]	        ; begin_list = begin_list->data
    call rdx			    ; *cmp((*being_list)->data, data_ref)
    pop rdx			        ; rdx <= stack
    pop rsi			        ; rsi <= stack
    pop rdi			        ; rdi <= stack
    cmp rax, 0		        ; if ret != 0
    jne stop		        ; return (stop)
    mov r10, [rdi]	        ; r10 = *begin_list
    mov r11, [r10 + 8]      ; r12 = *begin_list->next
    mov [rdi], r11	        ; *begin_list = (*begin_list)->next
    push rdi			    ; rdi => stack
    push rsi			    ; rsi => stack
    push rdx			    ; rdx => stack
    push r10			    ; r10 => stack
    push r11			    ; r11 => stack
    mov rdi, r10    	    ; tmp = *begin_list
    call _free	    	    ; free(*begin_list)
    pop r11		    	    ; r11 <= stack
    pop r10		    	    ; r10 <= stack
    pop rdx		    	    ; rdx <= stack
    pop rsi		    	    ; rsi <= stack
    pop rdi		    	    ; rdi <= stack
    jmp start	    	    ; jump to start

stop:
	mov r10, [rdi]	        ; r10 = *begin_list
    jmp loop

loop:
    mov r11, [r10 + 8]      ; r11 = r10->next
    cmp r10, 0		        ; if r10 == NULL
    je exit			        ; return (exit)
    cmp r11, 0		        ; if next == NULL
    je exit			        ; return (exit)
    push rdi			    ; rdi => stack
    push rsi			    ; rsi => stack
    push rdx			    ; rdx => stack
    push r10			    ; r10 => stack
    push r11			    ; r11 => stack
    mov rdi, [r11]	        ; tmp = next->data
    call rdx			    ; *cmp((*being_list)->data, data_ref)
    pop r11		    	    ; r11 <= stack
    pop r10		    	    ; r10 <= stack
    pop rdx		    	    ; rdx <= stack
    pop rsi		    	    ; rsi <= stack
    pop rdi		    	    ; rdi <= stack
    cmp rax, 0	    	    ; if ret != 0
    jne skip	    	    ; return (skip)
    push rdi			    ; rdi => stack
    push rsi			    ; rsi => stack
    push rdx			    ; rdx => stack
    push r10			    ; r10 => stack
    push r11			    ; r11 => stack
    mov rdi, r11    	    ; lst = next
    mov r11, [r11 + 8]      ; r11 = next->next
    mov [r10 + 8], r11      ; r10->next = next->next
    call _free		        ; free(next)
    pop r11		    	    ; r11 <= stack
    pop r10		    	    ; r10 <= stack
    pop rdx		    	    ; rdx <= stack
    pop rsi		    	    ; rsi <= stack
    pop rdi		    	    ; rdi <= stack
    jmp loop	    	    ; jump to loop

skip:
    mov r10, r11    	    ; *r10 = next
    jmp loop	    	    ; jump to loop

exit:
    ret                     ; return exit