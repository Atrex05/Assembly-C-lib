    BITS 64
    section .text
    global strncmp

strncmp:
    xor RAX, RAX    ; clear RAX
loop:
    CMP RAX, RDX                ; check if RAX == n
    je equal                    ; then it's equal

    movzx RCX, byte[RDI + RAX]  ; load the next byte from the first string
    movzx R8, byte[RSI + RAX]   ; load the next byte from the second string

    test RCX, RCX               ; if end of string
    je check_end                ; check end of other str

    sub RCX, R8                 ; subtract the two bytes to check if same value
    jnz not_equal               ; if not zero end with not equal

    inc RAX                     ; inc rax to check next byte
    jmp loop
check_end:
    test R8, R8                 ; check if the other string is also empty
    je equal                    ; if so then string are equal
    sub RCX, R8
    jmp not_equal
not_equal:
    mov RAX, RCX
    ret
equal:
    xor RAX, RAX
    ret