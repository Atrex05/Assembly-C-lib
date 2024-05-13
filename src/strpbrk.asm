    BITS 64
    section .text
    global strpbrk

strpbrk:
    xor RAX, RAX             ; Set RAX to 0 to count
    xor RCX, RCX             ; Set RCX to 0 to count
    xor RDX, RDX
loop:
    cmp BYTE[RDI + RAX], 0   ; Verify if it's the end of the string 0 stand for the \0
    je  not_found            ; If zero, leave the programm
    xor RCX, RCX
inside_loop:
    cmp BYTE[RSI + RCX], 0
    je add_len
    mov R8B, BYTE[RDI + RAX]
    cmp R8B, BYTE[RSI + RCX]
    je done
    inc RCX
    jmp inside_loop                 ; Call back the loop
add_len:
    inc RDX
    inc RAX
    jmp loop
not_found:
    xor RAX, RAX
    ret
done:
    mov RAX, RDI
    add RAX, RDX
    ret                      ; Return
