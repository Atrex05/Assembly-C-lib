    BITS 64
    section .text
    global memset

memset:
    xor RAX, RAX             ; Set RAX to 0 to count
loop:
    cmp RAX, RDX
    je  done
    mov BYTE[RDI + RAX], SIL
    inc RAX                  ; else ++RAX
    jmp loop                 ; Call back the loop
done:
    mov RAX, RDI
    ret                      ; Return
