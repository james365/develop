.equ GDBCON, 0x56000010
.equ GDBDAT, 0x56000014
.equ LOOPTIME, 0x00010000

.global _main
_main:

    ldr r0, =GDBCON @ set GDB5-8 output

    mov r1, #(0x55<<10)
    str r1, [r0]

    mov r1, #0
    ldr r0, =GDBDAT
loop:
    mvn r2, r1, lsl #5
    str r2, [r0]
    add r1, r1, #1
    cmp r1, #16
    moveq r1, #0
    bl delay

    b loop
delay:
    ldr r3, =LOOPTIME
delay1:
    sub r3, r3, #1
    cmp r3, #0x0
    bne delay1
    mov pc,lr
.end

