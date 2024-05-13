    BITS 64
    section .text
    global memmove

memmove:
    xor RAX, RAX             ; Set RAX to 0 to count
    cmp RSI, RDI
    je done
    jg copy_loop
    mov RAX, RDX
    dec RAX
    jmp inverted_copy
copy_loop:
    cmp RAX, RDX
    je done

    mov CL, BYTE[RSI + RAX]
    mov BYTE[RDI + RAX], CL
    inc RAX
    jmp copy_loop
inverted_copy:
    cmp RAX, -1
    je done

    mov CL, BYTE[RSI + RAX]
    mov BYTE[RDI + RAX], CL
    dec RAX
    jmp inverted_copy
done:
    mov RAX, RDI
    ret                      ; Return
