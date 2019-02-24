; $ nasm -f elf64 fib.asm
; $ gcc -m64 -no-pie -o fib fib.o
; $ ./fib

; C functions
    extern printf        ; The C function to be called

; section .data
    fmt: db "%d", 10, 0 ; The printf format, "\n", '0'

section .text
    global main

%macro pushaq 0
    push rax
    push rcx
    push rdx
    push rbx
    push rbp
    push rsi
    push rdi
%endmacro ; pushaq

%macro popaq 0
    pop rdi    
    pop rsi    
    pop rbp    
    pop rbx    
    pop rdx    
    pop rcx
    pop rax
%endmacro ; popaq

main:
       mov edi, 0xFF ; calculate up to 255
       mov eax, edi
       cmp edi, 0x1
       jbe .end
       jle .end
       sub edi, 0x1
       mov ecx, 0x0
       mov edx, 0x1
       mov esi, 0x0
       jmp .loop     ; jump over print the first time
.print:
       pushaq        ; too lazy to move things around to preserve values
       mov rdi, fmt  ; fmt string
       mov rsi, rax  ; value
       mov rax, 0
       call printf
       popaq         ; restore our values
.loop:
       lea eax, [rsi+rdx*1]
       add ecx, 0x1
       mov esi, edx
       mov edx, eax

       cmp eax, edi
       jbe .print
.end:
       ret
