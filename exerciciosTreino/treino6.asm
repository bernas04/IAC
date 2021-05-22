	.data
str: .asciiz "Introduza um número: "
str2: .asciiz ".|. "
	.text
	.globl main
	
main: la $a0, str
	li $v0, 4
	syscall
	
	li $v0, 5
	syscall
	
	move $t0, $v0
	li $t1, 0
	
for: beq $t1, $t0, fim
	
	la $a0, str2
	li $v0, 4
	syscall
	
	addi $t1, $t1, 1
	
	j for

fim: li $v0, 10
	syscall