; To assemble and run:
;     nasm -felf64 test.asm 
;     ld test.o -o test
;     ./test


section .text
       global _start

_start:
       ; mov edi, 0x2
       mov eax, edi
       cmp edi, 0x1
       jbe .end
       jle .end
       sub edi, 0x1
       mov ecx, 0x0
       mov edx, 0x1
       mov esi, 0x0
.loop: 
       lea eax, [rsi+rdx*1]
       add ecx, 0x1
       mov esi, edx
       mov edx, eax
       cmp ecx, edi
       jne .loop
.end:  
       ret
