    BITS 64
    section .text
    global strcmp

strcmp:
    xor RAX, RAX    ; clear RAX
loop:
    movzx RCX, byte[RDI + RAX]  ; load the next byte from the first string
    movzx RDX, byte[RSI + RAX]  ; load the next byte from the second string
    test RCX, RCX               ; if end of string
    je check_end                ; check other str
    sub RCX, RDX                ; subtract the two bytes to check if same value
    jnz not_equal               ; if not zero end with not equal
    inc RAX                     ; inc rax to check next byte
    jmp loop
check_end:
    test RDX, RDX               ; check if the other string is also empty
    je equal                    ; if so then string are equal
    sub RCX, RDX
    jmp not_equal
not_equal:
    mov RAX, RCX
    ret
equal:
    xor RAX, RAX
    ret