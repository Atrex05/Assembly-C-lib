    BITS 64
    section .text
    global strrchr

strrchr:
    xor RCX, RCX             ; Set RAX to 0 to count
len_loop:
    cmp BYTE[RDI + RCX], 0   ; Verify if it's the end of the string 0 stand for the \0
    je  loop                 ; If zero, leave the programm
    inc RCX                  ; else ++RCX
    jmp len_loop             ; Call back the loop
loop:
    cmp RCX, -1              ; Check if RCX is -1
    je  not_found            ; If -1, leave the programm
    cmp BYTE[RDI + RCX], SIL ; SIL stands for the character to find (RSI 8 bits register)
    je  found                ; If true return the pointer
    dec RCX                  ; else ++RCX
    jmp loop                 ; Call back the loop
not_found:
    xor RAX, RAX             ; Return 0
    ret
found:
    mov RAX, RDI             ; Move fst param to return
    add RAX, RCX             ; Add pointer pos
    ret
