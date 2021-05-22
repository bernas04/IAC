	.data
str: .asciiz "Introduza um número: "
str1: .asciiz "O número "
str2: .asciiz " é "
str3: .asciiz "par."
str4: .asciiz "impar."
	.text 
	.globl main
	
main: la $a0, str
	li $v0,4
	syscall
	
	li $v0, 5
	syscall
	
	
	move $s0, $v0
	andi $t0, $v0, 1
	beqz $t0, par
	
	la $a0, str1
	li $v0, 4
	syscall
	
	move $a0, $s0
	li $v0, 1
	syscall
	
	la $a0, str2
	li $v0, 4
	syscall
	
	la $a0, str4
	li $v0, 4
	syscall
	
	li $v0, 10
	syscall
	
par: la $a0, str1
	li $v0, 4
	syscall
	
	move $a0, $s0
	li $v0, 1
	syscall 
	
	la $a0, str2
	li $v0, 4
	syscall
	
	la $a0, str3
	li $v0, 4
	syscall
	
	li $v0, 10
	syscall