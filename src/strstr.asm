    BITS 64
    section .text
    global strstr

strstr:
    xor RAX, RAX    ; clear RAX
    xor R8, R8      ; clear R8
loop:
    movzx RCX, byte[RDI + RAX]  ; load the next byte from the first string
    inc RAX
    xor R8, R8

    mov R9, RAX

    test RCX, RCX               ; if end of string
    je not_found                ; str not found
inside_loop:
    movzx RDX, byte[RSI + R8]  ; load the next byte from the second string
    movzx RCX, byte[RDI + R9]

    test RDX, RDX
    je found
    test RCX, RCX
    je not_found

    sub RDX, RCX
    jnz loop

    inc R8
    inc R9
    jmp inside_loop
not_found:
    xor RAX, RAX
    ret
found:
    mov R8, RAX
    mov RAX, RDI
    ADD RAX, R8
    ret