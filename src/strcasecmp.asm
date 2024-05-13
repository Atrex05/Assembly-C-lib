    BITS 64
    section .text
    global strcasecmp

strcasecmp:
    xor RAX, RAX    ; clear RAX
loop:
    movzx RCX, byte[RDI + RAX]  ; load the next byte from the first string
    movzx RDX, byte[RSI + RAX]  ; load the next byte from the second string

    test RCX, RCX               ; if end of string
    je check_end                ; check other str

    ; check if 1st letter is uppercase
    cmp RCX, 'A'
    jl not_upper                ; if < 'A' cannot be uppercase
    cmp RCX, 'Z'
    jg not_upper                ; if > 'Z' cannot be uppercase
    add RCX, 32                 ; if uppercase then switch to lower

not_upper:
    ; same for 2nd letter
    cmp RDX, 'A'
    jl check_equal
    cmp RDX, 'Z'
    jg check_equal
    add RDX, 32

check_equal:
    sub RCX, RDX                ; subtract the two bytes to check if same value
    jnz not_equal               ; if not zero end with not equal
    inc RAX                     ; inc rax to check next byte
    jmp loop
check_end:
    test RDX, RDX               ; check if the other string is also at the end
    je equal                    ; if so then string are equal
    sub RCX, RDX
    jmp not_equal
not_equal:
    mov RAX, RCX
    ret
equal:
    xor RAX, RAX
    ret