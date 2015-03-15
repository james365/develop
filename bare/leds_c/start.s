.text
.global _start 
_start:
	@ disable watchdog
	ldr r3, =0x53000000
	mov r4, #0x0
	str r4, [r3]
	
	@ setup stack 
	ldr sp, =1024*4 
	
	bl main
halt_loop:
	b halt_loop


