bits 32
global _start
extern kmain

section .text
    ; Multiboot header. This must always be first to be compliant with multiboot.
    multiboot:
        align 4
        dd 0x1BADB002              	; magic value
        dd 0x00                    	; flags to use
        dd - (0x1BADB002 + 0x00)   	; checksum. m+f+c should be zero

    start:
        cli                         ; block all interrupts
        mov esp, stack_top          ; initialize the stack pointer
        call kmain                  ; call the kernel
        cli                         ; disable interrupts
        
    hang:
        hlt                         ; halt forever.
        jmp hang                    ; If a system management interrupt occurs, continue to halt.


section .bss
    stack_bottom:
        resb 1024                   ; Let our stack be 1KiB
    stack_top:
