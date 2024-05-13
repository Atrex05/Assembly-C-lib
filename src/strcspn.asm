    BITS 64
    section .text
    global strcspn

strcspn:
    xor RAX, RAX             ; Set RAX to 0 to count
    xor RCX, RCX             ; Set RCX to 0 to count
loop:
    cmp BYTE[RDI + RAX], 0   ; Verify if it's the end of the string 0 stand for the \0
    je  done                 ; If zero, leave the programm
    xor RCX, RCX
inside_loop:
    cmp BYTE[RSI + RCX], 0
    je add_len
    mov DL, BYTE[RDI + RAX]
    cmp DL, BYTE[RSI + RCX]
    je done
    inc RCX
    jmp inside_loop                 ; Call back the loop
add_len:
    inc RAX
    jmp loop
done:
    ret                      ; Return
