	.data
str: .asciiz "Introduza um número: "
str1: .asciiz "\nO número em hexadecimal é: "
	.text 
	.globl main
main: la $a0, str
	li $v0, 4
	syscall
	li $v0, 5
	syscall
	move $t3, $v0 #input
	li $t0, 0
	li $t1,8
	
for: beq $t0, $t1, done
	andi $t4, $t3, 0XF0000000
	sra $t4, $t4, 28
	la $a0, str1
	li $v0, 4
	syscall
	move $a0, $t4
	li $v0, 34
	syscall
	move $t4, $a0
	sll $t3, $t3, 4
	addi $t0, $t0,1
	j for
done: li $v0, 10
	syscall