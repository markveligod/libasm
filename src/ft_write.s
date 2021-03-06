section .text
    global _ft_write

; https://filippo.io/making-system-calls-from-assembly-in-mac-os-x/
; ft_write (rdi, rsi, rdx)

_ft_write:
    xor rax, rax            ; clear registr
    mov rax, 0x2000004      ; system call write
    syscall                 ; call to write function
    jc error                ; if (CF == 1) return (error)
    jmp exit                ; if (CF == 0) return (exit)

error:
    xor rax, rax            ; clear registr
    mov rax, -1             ; -1 => system call error
    ret

exit:
    ret