    BITS 64
    section .text
    global memcpy

memcpy:
    xor RAX, RAX             ; Set RAX to 0 to count
loop:
    cmp RAX, RDX
    je  done

    mov CL, BYTE[RSI + RAX]
    mov BYTE[RDI + RAX], CL
    inc RAX                  ; else ++RAX
    jmp loop                 ; Call back the loop
done:
    mov RAX, RDI
    ret                      ; Return
