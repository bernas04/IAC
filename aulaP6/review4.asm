	.data
over:	.asciiz "Está fodido||"
muda:	.asciiz "\n"
	.globl main
	.text
	
main:
	li $t1, 0xF000000
	li $t0, 28
	
while: beq $t0, $0, done
	srl $t1, $t1, 4 
	subi $t0, $t0, 4
	move $a0, $t1
	
	li $v0, 1
	syscall
	
	la $a0, muda
	li $v0, 4
	syscall
	
	j while
done:
	la $a0, over
	li $v0, 4
	syscall
	
	li $v0, 10
	syscall