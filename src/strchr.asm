    BITS 64
    section .text
    global strchr

strchr:
    xor RCX, RCX             ; Set RAX to 0 to count
loop:
    cmp BYTE[RDI + RCX], SIL ; SIL stands for the character to find (RSI 8 bits register)
    je  found                ; If true return the pointer
    cmp BYTE[RDI + RCX], 0   ; Verify if it's the end of the string 0 stand for the \0
    je  not_found            ; If zero, leave the programm
    inc RCX                  ; else ++RCX
    jmp loop                 ; Call back the loop
not_found:
    xor RAX, RAX             ; Return 0
    ret
found:
    mov RAX, RDI             ; Move fst param to return
    add RAX, RCX             ; Add pointer pos
    ret
