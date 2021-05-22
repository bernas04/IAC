.data
oper1: .word -217
oper2: .byte 48
	.align 2
resul: .space 4
	.text
	
main: la $t0, oper1
	la $t1, oper2
	lb $t2, 0($t1)
	srl $t3, $t2,2
	lw $t4, 0($t0)
	add $a0, $t4, $t3
	xori $a0, $a0, 0x8000
	la $t5, resul
	sw $a0, 0($t5)
	li $v0, 34
	syscall
	li $v0, 10
	syscall