	.data
str: .asciiz "Introduza um número\n"
str1: .asciiz "-"
	.text 
	.globl main
main: 
	la $a0, str
	li $v0, 4
	syscall
	li $v0, 5
	syscall
	move $t1, $v0
	li $t0, 0
	
for:	
	beq $t1, $t0, done
	la $a0, str1
	li $v0, 4
	syscall
	addi $t0, $t0,1
	j for
done: la $v0, 10
	syscall
	
	
	