    BITS 64
    section .text
    global strlen

strlen:
    xor RAX, RAX             ; Set RAX to 0 to count
loop:
    cmp BYTE[RDI + RAX], 0   ; Verify if it's the end of the string 0 stand for the \0
    je  done                 ; If zero, leave the programm
    inc RAX                  ; else ++RAX
    jmp loop                 ; Call back the loop
done:
    ret                      ; Return
