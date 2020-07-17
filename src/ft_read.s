section .text
    global _ft_read

; https://filippo.io/making-system-calls-from-assembly-in-mac-os-x/
; ft_read (rdi, rsi, rdx)

_ft_read:
    xor rax, rax            ; clear registr
    mov rax, 0x2000003      ; system call read
    syscall                 ; call to read function
    jc error                ; if (CF == 1) return (error)
    jmp exit                ; if (CF == 0) return (exit)

error:
    xor rax, rax            ; clear registr
    mov rax, -1             ; -1 => system call error
    ret

exit:
    ret