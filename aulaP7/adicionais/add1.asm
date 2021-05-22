	.data
str: .asciiz "Introduza 5 números\n"
str1: .asciiz "A soma dos números é: "
	.text 
	.globl main
main:	la $a0, str
	li $v0, 4
	syscall
	li $v0,5
	syscall
	move $t1, $v0
	li $v0,5
	syscall
	move $t2, $v0
	li $v0,5
	syscall
	move $t3, $v0
	li $v0,5
	syscall
	move $t4, $v0
	li $v0,5
	syscall
	move $t5, $v0
	
determina: bgtz $t1, soma
	bgtz $t2, soma
	bgtz $t3, soma
	bgtz $t4, soma
	bgtz $t5, soma
soma: li $t6, 0
	add $t6, $t6 , $t0
	add $t6, $t6 , $t2
	add $t6, $t6 , $t3
	add $t6, $t6 , $t4
	add $t6, $t6 , $t5
	la $a0, str1
	li $v0, 4
	syscall
	move $a0, $t6
	li $v0,1
	syscall
	
	
	